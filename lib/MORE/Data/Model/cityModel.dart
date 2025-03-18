class CityModel {
  int? cityId;
  String? cityNameAr;
  String? cityNameEn;
  int? cityActive;

  CityModel({this.cityId, this.cityNameAr, this.cityNameEn, this.cityActive});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityNameAr = json['city_nameAr'];
    cityNameEn = json['city_nameEn'];
    cityActive = json['city_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_nameAr'] = this.cityNameAr;
    data['city_nameEn'] = this.cityNameEn;
    data['city_active'] = this.cityActive;
    return data;
  }
}