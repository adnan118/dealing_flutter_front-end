import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constant/theme.dart';
import '../Function/GCMnotifiction.dart';
import '../Services/services.dart';

class LocalController extends GetxController {
  Locale? Language;
  Myservices Myservices1 = Get.find();
  ThemeData themApp = Ten;

  void changeLanguage(String Codelanguage) {
    Locale locale = Locale(Codelanguage);
    Myservices1.sharedPref!
        .setString('myLang', Codelanguage); //لحفظ اللغة عند اغلاق التطبيق
    themApp = Codelanguage == "ar" ? Tar : Ten;
    Get.changeTheme(themApp);
    Get.updateLocale(locale);
    update();
  }

//////////////////////////////////////////////s
  /*
  requesrPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Alert", 'Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Alert", 'Location services are disabled.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar(
          "Alert", 'Location services are disabled. why deniedForever!');
    }
  }
*/
//////////////////////////////////////////////e
  @override
  void onInit() {
    // requestPermissionNotifiction();
    // GCMnotifiction();

    //   requesrPermissionLocation();
    String? sharedprefLang = Myservices1.sharedPref.getString("myLang");
    if (sharedprefLang == "ar") {
      Language = Locale("ar");
      themApp = Tar;
    } else if (sharedprefLang == "en") {
      Language = Locale("en");
      themApp = Ten;
    } else {
      Language = Locale(Get.deviceLocale!.languageCode);
      themApp = Ten;
    }
    super.onInit();
  }
}
