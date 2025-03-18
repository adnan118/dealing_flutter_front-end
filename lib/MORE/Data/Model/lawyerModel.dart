class LawyerModel {
  int? lawyrId;
  String? lawyrNameAr;
  String? lawyrNameEn;
  String? lawyrPhone;
  String? lawyrEmail;
  int? lawyrYearsexperience;
  int? lawyrRate;
  int? lawyrBalance;
  int? lawyrTypeDealingPassOrDocsOrBoth;
  int? lawyrActive;
  int? lawyrCity;

  LawyerModel(
      {this.lawyrId,
        this.lawyrNameAr,
        this.lawyrNameEn,
        this.lawyrPhone,
        this.lawyrEmail,
        this.lawyrYearsexperience,
        this.lawyrRate,
        this.lawyrBalance,
        this.lawyrTypeDealingPassOrDocsOrBoth,
        this.lawyrActive,
        this.lawyrCity
      });

  LawyerModel.fromJson(Map<String, dynamic> json) {
    lawyrId = json['lawyr_id'];
    lawyrNameAr = json['lawyr_nameAr'];
    lawyrNameEn = json['lawyr_nameEn'];
    lawyrPhone = json['lawyr_phone'];
    lawyrEmail = json['lawyr_email'];
    lawyrYearsexperience = json['lawyr_yearsexperience'];
    lawyrRate = json['lawyr_rate'];
    lawyrBalance = json['lawyr_balance'];
    lawyrTypeDealingPassOrDocsOrBoth =
    json['lawyr_typeDealing_PassOrDocsOrBoth'];
    lawyrActive = json['lawyr_active'];
    lawyrCity = json['lawyr_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lawyr_id'] = this.lawyrId;
    data['lawyr_nameAr'] = this.lawyrNameAr;
    data['lawyr_nameEn'] = this.lawyrNameEn;
    data['lawyr_phone'] = this.lawyrPhone;
    data['lawyr_email'] = this.lawyrEmail;
    data['lawyr_yearsexperience'] = this.lawyrYearsexperience;
    data['lawyr_rate'] = this.lawyrRate;
    data['lawyr_balance'] = this.lawyrBalance;
    data['lawyr_typeDealing_PassOrDocsOrBoth'] =
        this.lawyrTypeDealingPassOrDocsOrBoth;
    data['lawyr_active'] = this.lawyrActive;
    data['lawyr_city'] = this.lawyrCity;
    return data;
  }
}