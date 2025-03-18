class TrackingModel {
  int? trackingId;
  int? trackingDocPassID;
  int? trackingUserId;
  String? trackingNameOwnerAr;
  String? trackingNameOwnerEn;
  String? trackingDescAr;
  String? trackingDescEn;
  String? trackingDocPassType;
  int? trackingTypeDocsID;
  String? trackingDate;
  int? trackingUseridUpdate	;
  int? trackingIsRating	;

  TrackingModel(
      {this.trackingId,
        this.trackingDocPassID,
        this.trackingUserId,
        this.trackingNameOwnerAr,
        this.trackingNameOwnerEn,
        this.trackingDescAr,
        this.trackingDescEn,
        this.trackingDocPassType,
        this.trackingTypeDocsID,
        this.trackingDate,
        this.trackingUseridUpdate,
        this.trackingIsRating,
      });

  TrackingModel.fromJson(Map<String, dynamic> json) {
    trackingId = json['tracking_id'];
    trackingDocPassID = json['tracking_docPassID'];
    trackingUserId = json['tracking_userId'];
    trackingNameOwnerAr = json['tracking_nameOwnerAr'];
    trackingNameOwnerEn = json['tracking_nameOwnerEn'];
    trackingDescAr = json['tracking_descAr'];
    trackingDescEn = json['tracking_descEn'];
    trackingDocPassType = json['tracking_docPassType'];
    trackingTypeDocsID = json['tracking_typeDocsID'];
    trackingDate = json['tracking_date'];
    trackingUseridUpdate = json['tracking_UseridUpdate'];
    trackingIsRating = json['tracking_isRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_id'] = this.trackingId;
    data['tracking_docPassID'] = this.trackingDocPassID;
    data['tracking_userId'] = this.trackingUserId;
    data['tracking_nameOwnerAr'] = this.trackingNameOwnerAr;
    data['tracking_nameOwnerEn'] = this.trackingNameOwnerEn;
    data['tracking_descAr'] = this.trackingDescAr;
    data['tracking_descEn'] = this.trackingDescEn;
    data['tracking_docPassType'] = this.trackingDocPassType;
    data['tracking_typeDocsID'] = this.trackingTypeDocsID;
    data['tracking_date'] = this.trackingDate;
    data['tracking_UseridUpdate'] = this.trackingUseridUpdate;
    data['tracking_isRating'] = this.trackingIsRating;
    return data;
  }
}
