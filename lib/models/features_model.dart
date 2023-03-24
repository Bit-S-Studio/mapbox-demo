import '../_exports.dart';

class FeaturesModel {
  var id;
  var type;
  List<dynamic>? placeType;
  var relevance;
  PropertiesModel? properties;
  var textEn;
  var languageEn;
  var placeNameEn;
  var text;
  var language;
  var placeName;
  List<dynamic>? bbox;
  List<dynamic>? center;
  GeometryModel? geometry;
  List<ContextModel>? context;

  FeaturesModel(
      {this.id,
      this.type,
      this.placeType,
      this.relevance,
      this.properties,
      this.textEn,
      this.languageEn,
      this.placeNameEn,
      this.text,
      this.language,
      this.placeName,
      this.bbox,
      this.center,
      this.geometry,
      this.context});

  FeaturesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    placeType = json['place_type'];
    relevance = json['relevance'];
    properties = json['properties'] != null
        ? PropertiesModel.fromJson(json['properties'])
        : null;
    textEn = json['text_en'];
    languageEn = json['language_en'];
    placeNameEn = json['place_name_en'];
    text = json['text'];
    language = json['language'];
    placeName = json['place_name'];
    bbox = json['bbox'];
    center = json['center'];
    geometry = json['geometry'] != null
        ? GeometryModel.fromJson(json['geometry'])
        : null;
    if (json['context'] != null) {
      context = <ContextModel>[];
      json['context'].forEach((v) {
        context!.add(ContextModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['place_type'] = this.placeType;
    data['relevance'] = this.relevance;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    data['text_en'] = this.textEn;
    data['language_en'] = this.languageEn;
    data['place_name_en'] = this.placeNameEn;
    data['text'] = this.text;
    data['language'] = this.language;
    data['place_name'] = this.placeName;
    data['bbox'] = this.bbox;
    data['center'] = this.center;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    if (this.context != null) {
      data['context'] = this.context!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
