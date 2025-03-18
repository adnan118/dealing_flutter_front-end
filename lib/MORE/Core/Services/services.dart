/*
 * يتم استخدام servicesGetX
 * من اجل وضع جميع المتغيرات والعملية المطلوب تنفيذها في بداية التطبيق بدلا من وضعها كمتغيرات غلوبال في التابع مييين
 *
 */

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/Account/account_Controller.dart';

class Myservices extends GetxService {
  late SharedPreferences sharedPref;

  Future<Myservices> init() async {
    await Firebase.initializeApp();
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Myservices().init());
}
