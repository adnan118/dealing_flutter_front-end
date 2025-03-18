import 'package:Dealings/MORE/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../../Controller/Traking/traking_Controller.dart';
import '../Home/customButtomHome.dart';

Traking_Controller traking_controller = Get.find();

void showRating(BuildContext context, lawyer_id,tracking_id) {
  try {
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
        initialRating: 0.0,
        title: Text(
          "___ Or ___".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: ColorApp.warmGray),
        ),
        message: Text(
          'RatingReq'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        image: customButtomHome(
          text: "Lessthanastar".tr,
          color: ColorApp.warmGray,
          onPressed: () {
            Get.defaultDialog(
                title: "Lessthanastar".tr,
                content: Image.asset("assets/images/More/unlike.png",
                    width: 100, height: 100),
                buttonColor: ColorApp.caddiesSilk,
                confirmTextColor: ColorApp.pureWhite,
                onConfirm: () {
                  Get.back();
                  Get.back();
                  traking_controller.submitRating(lawyer_id, 0,tracking_id);
                });
          },
        ),
        submitButtonText: 'Submit'.tr,
        submitButtonTextStyle: TextStyle(
            overflow: TextOverflow.fade,
            color: ColorApp.intergalactic,
            fontSize: 20),
        commentHint: '',
        starColor: ColorApp.paw,
        enableComment: false,
        onCancelled: () => print('cancelled'),
        onSubmitted: (response) {
          print('rating: ${response.rating}, comment: ${response.comment}');
          traking_controller.submitRating(lawyer_id, response.rating,tracking_id);
        },
      ),
    );
  } catch (e, s) {
    print(s);
  }
}
