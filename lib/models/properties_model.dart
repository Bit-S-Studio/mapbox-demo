class PropertiesModel {
  var wikidata;
  var accuracy;

  PropertiesModel({this.wikidata, this.accuracy});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    wikidata = json['wikidata'];
    accuracy = json['accuracy'];
  }

  Map<String, dynamic> toJson() => {'wikidata': wikidata, 'accuracy': accuracy};
}
