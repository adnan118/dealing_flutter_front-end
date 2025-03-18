import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../MORE/Core/Services/services.dart';
import '../../../MORE/DB/statusRequest.dart';
import '../../MORE/Classes/HandlingDataController.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Localization/translateDB.dart';
import '../../MORE/Data/DataSource/Remote/paymentReceiptsRemoteData.dart';
import '../../MORE/Data/DataSource/Remote/paymentsRemoteData.dart';
import '../../MORE/Data/DataSource/Remote/stausPayRemoteData.dart';
import '../../MORE/Data/Model/paymentModel.dart';
import '../../MORE/Data/Model/stausPayModel.dart';
import '../../Widget/RequestDocs/btnAttach.dart';
import '../../Widget/RequestDocs/customButtomRD.dart';

class Payments_Controller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  PaymentsRemoteData paymentsRemoteData = PaymentsRemoteData(Get.find());
  StausPayRemoteData stausPayRemoteData = StausPayRemoteData(Get.find());
  PaymentReceiptsRemoteData paymentReceiptsRemoteData =
      PaymentReceiptsRemoteData(Get.find());
  Myservices myservices = Get.find();
  GlobalKey<FormState> myKeyPaymentReceipts = GlobalKey<FormState>();

  PaymentModel? paymentModel;
  StausPayModel? stausPayModel;

  List<PaymentModel> listOFPayment = [];
  List<StausPayModel> listOFStatusPay = [];

  void getPayments() async {
    listOFPayment.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();

    var response = await paymentsRemoteData.postData(
      myservices.sharedPref.getInt("user_id").toString()!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          paymentModel = PaymentModel.fromJson(userData);
          listOFPayment.add(paymentModel!);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  void getStatusPay() async {
    listOFStatusPay.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await stausPayRemoteData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          stausPayModel = StausPayModel.fromJson(userData);
          listOFStatusPay.add(stausPayModel!);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  convertCodeStatus(statusCode) {
    var status = listOFStatusPay.firstWhere(
      (status) => status.trakingPayId == statusCode,
      orElse: () => StausPayModel(
          trakingPayId: statusCode,
          trakingPayNameAr: "غير معروف",
          trakingPayNameEn: "Unknown Status"),
    );

    return translateDB(status.trakingPayNameAr ?? "غير معروف",
        status.trakingPayNameEn ?? "Unknown Status");
  }

  late var imgID = "avatar5.jpg";

  RxBool f = false.obs;

  dialogForPaymentReceipts(
      context, invoicNum, totalCoast, docsPass_id, typeReq) {
    return Get.bottomSheet(Container(
      decoration: BoxDecoration(
        color: ColorApp.paw,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(20),
      child: Form(
        key: myKeyPaymentReceipts,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("PaymentNumber".tr + " : " + invoicNum,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18)),
            Text("Paymentamount".tr + " : " + totalCoast,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 15, color: ColorApp.caddiesSilk)),
            SizedBox(height: 20),
            Obx(
              () => BtnAttach(
                colorbg: ColorApp.pureWhite.withOpacity(0.8),
                colorlable: ColorApp.caddiesSilk,
                padding: 25,
                margin: EdgeInsets.symmetric(horizontal: 40),
                textbefor: "PleaseselectimagePaymentReceipts".tr,
                textafter: f.value == false ? " " : "AttachidentityDone".tr,
                iconsbefore: Icons.image_outlined,
                iconsafter: Icons.done,
                condition: xfile == null,
                onPressed: () {
                  xfile = null;
                  chooesImg();
                  update();
                },
              ),
            ),
            customButtomRD(
              onPressed: () {
                Get.back();
                sendPaymentReceiptsIMG(
                        invoicNum, totalCoast, docsPass_id, typeReq)
                    .then((_) {

                  xfile = null;
                  f.value = false;
                });
              },
              text: "confirmation".tr,
            ),
          ],
        ),
      ),
    ));
  }

  /////////////////////

  XFile? xfile;
  File? myfile;

  chooesImg() async {
    update();
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      myfile = File(xfile!.path);
      print(myfile);
      f.value = true;
    } else {
      print("No image selected.");
      f.value = false;
    }
    update();
  }

  sendPaymentReceiptsIMG(invoicNum, totalCoast, docsPass_id, typeReq) async {
    var formdata = myKeyPaymentReceipts.currentState;

    if (formdata!.validate()) {
      if (myfile == null) {
        Get.snackbar("Error".tr, "PleaseselectimagePaymentReceipts".tr);
        return;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await paymentReceiptsRemoteData.setData(
        myservices.sharedPref.getInt("user_id").toString()!,
        invoicNum,
        imgID,
        totalCoast,
        docsPass_id,
        typeReq,
        myfile,
      );
      if (response == null) {
        Get.defaultDialog(title: "Error".tr, middleText: "Response is null.");
        statusRequest = StatusRequest.failuer;
        update();
        print('Response from server: $response');
        return response; // تأكد من أن هذا هو ما ترجع
        return; // للخروج من الدالة إذا كانت الاستجابة null
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          getPayments();
        } else {
          Get.defaultDialog(title: "Error".tr, middleText: "Errortitle".tr);
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
      print("Data valid");
    } else {
      print("Data not valid");
    }
  }

  @override
  void onInit() {
    getPayments();
    getStatusPay();
    super.onInit();
  }
}

//total is null

//update payment in table pay
