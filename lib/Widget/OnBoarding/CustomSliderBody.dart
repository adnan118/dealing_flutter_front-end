import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/OnBoarding/onBoardingController.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Data/DataSource/Static/static.dart';

class CustomSliderBody extends GetView<OnBoardingControllerImp> {
  const CustomSliderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (val) {
            controller.onPageChanged(val);
          },
          itemCount: onBoardingModelList.length,
          itemBuilder: (context, i) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(onBoardingModelList[i].title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge!),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    onBoardingModelList[i].image!,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(onBoardingModelList[i].body!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorApp.caddiesSilk,
                        fontSize: 18,fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
