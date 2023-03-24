class MapDataModel {
  String? eta;
  String? latLngJSON;
  String? type;

  MapDataModel({this.eta, this.latLngJSON, this.type});

  MapDataModel.fromJson(Map<String, dynamic> json) {
    eta = json['eta'];
    latLngJSON = json['latLngJSON'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() =>
      {'eta': eta, 'latLngJSON': latLngJSON, 'type': type};
}
