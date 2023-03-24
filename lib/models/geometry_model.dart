class GeometryModel {
  var type;
  List<dynamic>? coordinates;

  GeometryModel({this.type, this.coordinates});

  GeometryModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'];
  }

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}
