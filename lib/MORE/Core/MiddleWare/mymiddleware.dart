import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/services.dart';

class Mymiddleware extends GetMiddleware {
  Myservices myservices = Get.find();

  int? get priority => 1; //الاهمية
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPref.getString("step") == "2") {
      return RouteSettings(name: "/MainScreen");
    }

    if (myservices.sharedPref.getString("step") == "1") {
      return RouteSettings(name: "/Language"); //login
    }
    return null;
  }
}
