import '../_exports.dart';

class LocationModel {
  var type;
  List<dynamic>? query;
  List<FeaturesModel>? features;
  var attribution;

  LocationModel({this.type, this.query, this.features, this.attribution});

  LocationModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    query = json['query'];
    if (json['features'] != null) {
      features = <FeaturesModel>[];
      json['features'].forEach((v) {
        features!.add(FeaturesModel.fromJson(v));
      });
    }
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'query': query,
        if (features != null)
          'features': features!.map((v) => v.toJson()).toList(),
        'attribution': attribution
      };
}
