import 'package:get/get.dart';

import '../Services/services.dart';

translateDB (colAr,colEn){
  Myservices myservices=Get.find();
  if(myservices.sharedPref.getString("myLang") == "en"){
    return colEn;
  }else{
    return colAr;
  }
}