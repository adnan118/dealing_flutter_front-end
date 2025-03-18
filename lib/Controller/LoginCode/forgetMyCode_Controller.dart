import 'package:Dealings/MORE/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MORE/Classes/HandlingDataController.dart';
import '../../MORE/DB/statusRequest.dart';
import '../../MORE/Data/DataSource/Remote/forgetCodeRemoteData.dart';


class ForgetMyCode_Controller extends GetxController {

  GlobalKey<FormState> myKeyF = GlobalKey<FormState>();

  ForgetCodeRemoteData forgetCodeRemoteData = ForgetCodeRemoteData(Get.find());

  late TextEditingController chKemail ;
  late StatusRequest  statusRequest=StatusRequest.none;

  @override
  checkEmail() async {

    if (myKeyF.currentState!.validate()) {
      //loading
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetCodeRemoteData.postData(
          chKemail.text);
      print("$response *****");
      //
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.defaultDialog(
              title: "newCodetitle".tr,
              middleText: "newCodeBody".tr,
            buttonColor: ColorApp.caddiesSilk,
            confirmTextColor: ColorApp.pureWhite,
            textConfirm: "OK".tr,
            onConfirm: (){
        //        Get.offAllNamed("/LoginCode");
              }
          );

        } else {
          Get.defaultDialog(
              title: "Error".tr,
              middleText: "ErrortitleEmailNotFound".tr
          );
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    }
  }


  @override
  void onInit() {
    chKemail = TextEditingController( );
    super.onInit();
  }
}
