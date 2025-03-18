import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/OnBoarding/onBoardingController.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Data/DataSource/Static/static.dart';

class CustomDottController extends StatelessWidget {
  const CustomDottController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingModelList.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          duration: Duration(milliseconds: 500),
                          width: controller.CurrentPage == index ? 20 : 15,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.CurrentPage == index
                                ? ColorApp.intergalactic
                                : ColorApp.mildBlue,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        )),
              ],
            ));
  }
}
