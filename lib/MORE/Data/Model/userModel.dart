class UserModel {
  int? userId;
  String? userName;
  String? userLocation;
  String? userEmail;
  String? userPhone;
  String? userImg;
  int? userCode;
  int? userRole;

  UserModel(
      {this.userId,
        this.userName,
        this.userLocation,
        this.userEmail,
        this.userPhone,
        this.userImg,
        this.userCode,
        this.userRole});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userLocation = json['user_location'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userImg = json['user_img'];
    userCode = json['user_code'];
    userRole = json['user_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_location'] = this.userLocation;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['user_img'] = this.userImg;
    data['user_code'] = this.userCode;
    data['user_role'] = this.userRole;
    return data;
  }
}
