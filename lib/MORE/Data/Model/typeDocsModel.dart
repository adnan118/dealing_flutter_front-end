class TypeDocsModel {
  int? typeDocsIdId;
  String? typeDocsIdNameAr;
  String? typeDocsIdNameEn;
  int? typeDocsIdCoast;
  String? typeDocsIdDate;
  int? typeDocsIdDuration;
  int? typeDocsIdActive;

  TypeDocsModel(
      {this.typeDocsIdId,
        this.typeDocsIdNameAr,
        this.typeDocsIdNameEn,
        this.typeDocsIdCoast,
        this.typeDocsIdDate,
        this.typeDocsIdDuration,
        this.typeDocsIdActive});

  TypeDocsModel.fromJson(Map<String, dynamic> json) {
    typeDocsIdId = json['typeDocsId_id'];
    typeDocsIdNameAr = json['typeDocsId_nameAr'];
    typeDocsIdNameEn = json['typeDocsId_nameEn'];
    typeDocsIdCoast = json['typeDocsId_coast'];
    typeDocsIdDate = json['typeDocsId_date'];
    typeDocsIdDuration = json['typeDocsId_duration'];
    typeDocsIdActive = json['typeDocsId_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeDocsId_id'] = this.typeDocsIdId;
    data['typeDocsId_nameAr'] = this.typeDocsIdNameAr;
    data['typeDocsId_nameEn'] = this.typeDocsIdNameEn;
    data['typeDocsId_coast'] = this.typeDocsIdCoast;
    data['typeDocsId_date'] = this.typeDocsIdDate;
    data['typeDocsId_duration'] = this.typeDocsIdDuration;
    data['typeDocsId_active'] = this.typeDocsIdActive;
    return data;
  }
}