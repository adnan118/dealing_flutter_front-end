class NationalityModel {
  int? nationalityId;
  String? nationalityNameAr;
  String? nationalityNameEn;
  int? nationalityActive;

  NationalityModel(
      {this.nationalityId,
        this.nationalityNameAr,
        this.nationalityNameEn,
        this.nationalityActive});

  NationalityModel.fromJson(Map<String, dynamic> json) {
    nationalityId = json['nationality_id'];
    nationalityNameAr = json['nationality_nameAr'];
    nationalityNameEn = json['nationality_nameEn'];
    nationalityActive = json['nationality_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nationality_id'] = this.nationalityId;
    data['nationality_nameAr'] = this.nationalityNameAr;
    data['nationality_nameEn'] = this.nationalityNameEn;
    data['nationality_active'] = this.nationalityActive;
    return data;
  }
}