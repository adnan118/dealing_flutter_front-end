class NotificationsModel {
  int? notificationId;
  String? notificationBodyAr;
  String? notificationBodyEn;
  String? notificationTitleAr;
  String? notificationTitleEn;
  int? notificationUser;
  String? notificationNamePage;
  String? notificationDateInsert;
  int? notificationRead;

  NotificationsModel(
      {this.notificationId,
        this.notificationBodyAr,
        this.notificationBodyEn,
        this.notificationTitleAr,
        this.notificationTitleEn,
        this.notificationUser,
        this.notificationNamePage,
        this.notificationDateInsert,
        this.notificationRead});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationBodyAr = json['notification_bodyAr'];
    notificationBodyEn = json['notification_bodyEn'];
    notificationTitleAr = json['notification_titleAr'];
    notificationTitleEn = json['notification_titleEn'];
    notificationUser = json['notification_user'];
    notificationNamePage = json['notification_namePage'];
    notificationDateInsert = json['notification_dateInsert'];
    notificationRead = json['notification_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_bodyAr'] = this.notificationBodyAr;
    data['notification_bodyEn'] = this.notificationBodyEn;
    data['notification_titleAr'] = this.notificationTitleAr;
    data['notification_titleEn'] = this.notificationTitleEn;
    data['notification_user'] = this.notificationUser;
    data['notification_namePage'] = this.notificationNamePage;
    data['notification_dateInsert'] = this.notificationDateInsert;
    data['notification_read'] = this.notificationRead;
    return data;
  }
}
