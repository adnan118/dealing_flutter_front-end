class TypePassportModel {
  int? typePassportId;
  String? typePassportNameAr;
  String? typePassportNameEn;
  int? typePassportCoast;
  int? typePassportActive;

  TypePassportModel(
      {this.typePassportId,
        this.typePassportNameAr,
        this.typePassportNameEn,
        this.typePassportCoast,
        this.typePassportActive});

  TypePassportModel.fromJson(Map<String, dynamic> json) {
    typePassportId = json['typePassport_id'];
    typePassportNameAr = json['typePassport_nameAr'];
    typePassportNameEn = json['typePassport_nameEn'];
    typePassportCoast = json['typePassport_coast'];
    typePassportActive = json['typePassport_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typePassport_id'] = this.typePassportId;
    data['typePassport_nameAr'] = this.typePassportNameAr;
    data['typePassport_nameEn'] = this.typePassportNameEn;
    data['typePassport_coast'] = this.typePassportCoast;
    data['typePassport_active'] = this.typePassportActive;
    return data;
  }
}