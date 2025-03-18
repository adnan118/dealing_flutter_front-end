
import 'package:get/get.dart';
String? validinput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "vEmpty".tr;
  }
  // تحقق من الطول
  if (val.length < min) {
    return "vMin".tr + "$min";
  }
  if (val.length > max) {
    return "vMax".tr + "$max";
  }

  // تحقق من الرقم
  if (type == "num" && !GetUtils.isNum(val)) {
    return "vNum".tr;
  }

  // تحقق من URL
  if (type == "url" && !GetUtils.isURL(val)) {
    return "vURL".tr;
  }



  //username
  if(type=="username"){
    if(!GetUtils.isUsername(val)){
      return "vUsername".tr;
    }
  }
  // تحقق من البريد الإلكتروني
  if (type == "email" && !GetUtils.isEmail(val)) {
    return "vEmail".tr;
  }

  // تحقق من رقم الهاتف
  if (type == "phone" && !GetUtils.isPhoneNumber(val)) {
    return "vPhone".tr;
  }



  // إذا كانت كل الشروط صحيحة، أعِد null
  return null;
}