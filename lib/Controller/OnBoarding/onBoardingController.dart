import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../MORE/Core/Services/services.dart';
import '../../MORE/Data/DataSource/Static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int CurrentPage = 0;
  Myservices myservices = Get.find();
  late PageController pageController;


  @override
  next() {
    update();
    CurrentPage++;
    if (CurrentPage > onBoardingModelList.length - 1) {
      myservices.sharedPref.setString("step",
          "1"); //لاجل معرفة ان المستخدم قد دخل ونسجل ذلك كي لاتظهر شاشة الترحيب ثانية
      Get.offAllNamed("/LoginCode");
    } else {
      pageController.animateToPage(CurrentPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut);
    }
  }



  @override
  onPageChanged(int index) {
    CurrentPage = index;

    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
