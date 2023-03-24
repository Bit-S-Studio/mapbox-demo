import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../_exports.dart';
import 'package:flutter/material.dart';

class MapBoxController {
  final MapBoxForm form;
  MapBoxController({required this.form});
  final isResponseForDestination = ValueNotifier<bool>(true);
  final isLoading = ValueNotifier<bool>(false);
  final initialRoute = ValueNotifier<String>('Initial Route Data: unknown.');
  final reportStatus = ValueNotifier<String>('ETA: unknown.');
  final locationList = ValueNotifier<LocationModel>(LocationModel());

  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/game');
  static const EventChannel eventChannel =
      EventChannel('samples.flutter.io/report');

  Future<LocationModel> getParsedResponseForQuery(String value) async {
    // If empty query send blank response
    String query = getValidatedQueryFromQuery(value);
    if (query == '') return LocationModel();

    // Else search and then send response
    var response = await getSearchResultsFromQueryUsingMapbox(query);

    LocationModel data =
        LocationModel.fromJson(jsonDecode(response.toString()));

    return data;
  }

  Future getSearchResultsFromQueryUsingMapbox(String query) async {
    String url =
        '${ConstantsConfigs.baseUrl}/$query.json?limit=${ConstantsConfigs.searchResultsLimit}&types=${ConstantsConfigs.searchType}&&access_token=${ConstantsConfigs.accessToken}';
    url = Uri.parse(url).toString();
    debugPrint(url);
    try {
      final responseData = await http.get(Uri.parse(url));
      return responseData.body;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String getValidatedQueryFromQuery(String query) {
    // Remove whitespaces
    String validatedQuery = query.trim();
    return validatedQuery;
  }

  void onChangeHandler(String value) async {
    // Get response using Mapbox Search API
    locationList.value.features = [];
    isLoading.value = true;
    locationList.value = await getParsedResponseForQuery(value);
    isLoading.value = false;
  }

  Future<void> postDataToNative(Map data) async {
    try {
      eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
      await methodChannel.invokeMethod('startNewActivity', data);
    } on PlatformException catch (e) {
      debugPrint("Failed to Invoke: '${e.message}'.");
    }
  }

  void _onEvent(Object? event) {
    var str = event.toString();
    final user = MapDataModel.fromJson(jsonDecode(str));
    var time = user.eta;
    if (user.type == "initial_route") {
      initialRoute.value = user.latLngJSON!;
    }
    if (user.type == "eta") {
      reportStatus.value = "ETA: $time Min";
    }
    debugPrint(reportStatus.value);
  }

  void _onError(Object error) {
    reportStatus.value = 'ETA: unknown.';
  }
}
