import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MORE/Classes/HandlingDataController.dart';
import '../../../MORE/Core/Localization/translateDB.dart';
import '../../../MORE/Core/Services/services.dart';
import '../../../MORE/DB/statusRequest.dart';
import '../../../MORE/Data/DataSource/Remote/consultationRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/infoLawerRemoteData.dart';
import '../../../MORE/Data/Model/consultationModel.dart';
import '../../../MORE/Data/Model/lawyerModel.dart';

class LegalConsultation_Controller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> myKeyconsultation = GlobalKey<FormState>();
  ConsultationRemoteData consultationRemoteData =
      ConsultationRemoteData(Get.find());
  Myservices myservices = Get.find();
  ConsultationModel? consultationModel;
  late TextEditingController detailsController;

  late TextEditingController detailsControllerTitle;

  List<LawyerModel> listOfLawyers = [];
  LawyerModel? lawyerModel;
  InfoLawerRemoteData infoLawerRemoteData = InfoLawerRemoteData(Get.find());
  List<ConsultationModel> listOfPreviousConsultations = [];

  void getPreviousConsultations() async {
    listOfPreviousConsultations.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await consultationRemoteData.postData(
      myservices.sharedPref.getInt("user_id").toString()!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];
        for (var userData in responseData) {
          consultationModel = ConsultationModel.fromJson(userData);
          listOfPreviousConsultations.add(consultationModel!);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  convertlwyerLawyerCode(lawyrCode) {
    var status = listOfLawyers.firstWhere(
      (status) => status.lawyrId == lawyrCode,
      orElse: () => LawyerModel(
          lawyrId: lawyrCode,
          lawyrNameAr: "غير معروف",
          lawyrNameEn: "Unknown Status"),
    );

    return translateDB(status.lawyrNameAr ?? "غير معروف",
        status.lawyrNameEn ?? "Unknown Status");
  }

  void getLawers() async {
    listOfLawyers.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await infoLawerRemoteData.postData("2");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          LawyerModel lawyerModel = LawyerModel.fromJson(userData);
          listOfLawyers.add(lawyerModel);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  sendConsultations() async {
    var formdata = myKeyconsultation.currentState;

    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await consultationRemoteData.postDataInsert(
        myservices.sharedPref.getInt("user_id").toString()!,
        detailsControllerTitle.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print("Data success");

        if (response['status'] == "success") {
          Get.snackbar("Submittedsuccessfully".tr, "consultationresponse".tr);
          Get.offNamed("/LegalConsultation");
          detailsControllerTitle.text = "";
          detailsController.text = "";
          getPreviousConsultations();
        } else {
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
    detailsController = TextEditingController();
    detailsControllerTitle = TextEditingController();
    getPreviousConsultations();
    getLawers();
    super.onInit();
  }
}
