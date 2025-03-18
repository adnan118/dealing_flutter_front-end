class StausPayModel {
  int? trakingPayId;
  int? trakingPayIdStatus;
  String? trakingPayNameAr;
  String? trakingPayNameEn;

  StausPayModel(
      {this.trakingPayId,
        this.trakingPayIdStatus,
        this.trakingPayNameAr,
        this.trakingPayNameEn});

  StausPayModel.fromJson(Map<String, dynamic> json) {
    trakingPayId = json['trakingPay_id'];
    trakingPayIdStatus = json['trakingPay_idStatus'];
    trakingPayNameAr = json['trakingPay_nameAr'];
    trakingPayNameEn = json['trakingPay_nameEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trakingPay_id'] = this.trakingPayId;
    data['trakingPay_idStatus'] = this.trakingPayIdStatus;
    data['trakingPay_nameAr'] = this.trakingPayNameAr;
    data['trakingPay_nameEn'] = this.trakingPayNameEn;
    return data;
  }
}
