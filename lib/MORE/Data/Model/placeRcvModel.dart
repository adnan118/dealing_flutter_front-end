class PlaceRcvModel {
  int? placeRcvId;
  String? placeRcvNameAr;
  String? placeRcvNameEn;
  int? placeRcvCoast;
  int? placeRcvActive;

  PlaceRcvModel(
      {this.placeRcvId,
        this.placeRcvNameAr,
        this.placeRcvNameEn,
        this.placeRcvCoast,
        this.placeRcvActive});

  PlaceRcvModel.fromJson(Map<String, dynamic> json) {
    placeRcvId = json['placeRcv_id'];
    placeRcvNameAr = json['placeRcv_nameAr'];
    placeRcvNameEn = json['placeRcv_nameEn'];
    placeRcvCoast = json['placeRcv_coast'];
    placeRcvActive = json['placeRcv_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeRcv_id'] = this.placeRcvId;
    data['placeRcv_nameAr'] = this.placeRcvNameAr;
    data['placeRcv_nameEn'] = this.placeRcvNameEn;
    data['placeRcv_coast'] = this.placeRcvCoast;
    data['placeRcv_active'] = this.placeRcvActive;
    return data;
  }
}
