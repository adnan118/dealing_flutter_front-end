class TransLangModel {
  int? transLangId;
  String? transLangNameAr;
  String? transLangNameEn;
  int? transLangCoast;
  int? transLangActive;

  TransLangModel(
      {this.transLangId,
        this.transLangNameAr,
        this.transLangNameEn,
        this.transLangCoast,
        this.transLangActive});

  TransLangModel.fromJson(Map<String, dynamic> json) {
    transLangId = json['transLang_id'];
    transLangNameAr = json['transLang_nameAr'];
    transLangNameEn = json['transLang_nameEn'];
    transLangCoast = json['transLang_coast'];
    transLangActive = json['transLang_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transLang_id'] = this.transLangId;
    data['transLang_nameAr'] = this.transLangNameAr;
    data['transLang_nameEn'] = this.transLangNameEn;
    data['transLang_coast'] = this.transLangCoast;
    data['transLang_active'] = this.transLangActive;
    return data;
  }
}