class ContextModel {
  var id;
  var shortCode;
  var wikidata;
  var textEn;
  var languageEn;
  var text;
  var language;

  ContextModel(
      {this.id,
      this.shortCode,
      this.wikidata,
      this.textEn,
      this.languageEn,
      this.text,
      this.language});

  ContextModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shortCode = json['short_code'];
    wikidata = json['wikidata'];
    textEn = json['text_en'];
    languageEn = json['language_en'];
    text = json['text'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'short_code': shortCode,
        'wikidata': wikidata,
        'text_en': textEn,
        'language_en': languageEn,
        'text': text,
        'language': language
      };
}
