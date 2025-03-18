import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../Constant/color.dart';
import '../../Constant/imageasset.dart';
import '../changelocal.dart';
import 'CustombtnLang.dart';



class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.pureWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "chooseLanguage".tr,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorApp.blackNero, // لون داكن يناسب الطابع الرسمي
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset(
              ImageAssetApp.selectlanguage,
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30),
            CustombtnLanguage(
              textBtn: "عربي",
              onPressed: () {
                controller.changeLanguage("ar");
                Get.offAllNamed("/OnBoarding");
              },
            ),
            CustombtnLanguage(
              textBtn: "English",
              onPressed: () {
                controller.changeLanguage("en");
                Get.offAllNamed("/OnBoarding");
              },
            ),
          ],
        ),
      ),
    );
  }
}