import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/OnBoarding/onBoardingController.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../Widget/OnBoarding/CustomBtnContinue.dart';
import '../../Widget/OnBoarding/CustomDottController.dart';
import '../../Widget/OnBoarding/CustomSliderBody.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp onBoarding_ControllerImp =
        Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: ColorApp.pureWhite,
      body: Container(
          padding: EdgeInsets.only(top: 0, left: 20, right: 20),
          width: double.infinity,
          child: SafeArea(
              child: Column(
            children: [
              Expanded(
                flex: 6,
                child: CustomSliderBody(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDottController(),
                      SizedBox(
                        height: 25,
                      ),
                      CustomBtnContinue(),
                    ],
                  ))
            ],
          ))),
    );
  }
}
