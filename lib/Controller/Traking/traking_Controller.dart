import 'package:get/get.dart';

import '../../MORE/Classes/HandlingDataController.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Localization/translateDB.dart';
import '../../MORE/Core/Services/services.dart';
import '../../MORE/DB/statusRequest.dart';
import '../../MORE/Data/DataSource/Remote/trackingRemoteData.dart';
import '../../MORE/Data/DataSource/Remote/typeDocsRemoteData.dart';
import '../../MORE/Data/Model/trackingModel.dart';
import '../../MORE/Data/Model/typeDocsModel.dart';

class Traking_Controller extends GetxController {
  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TypeDocsRemoteData typeDocsRemoteData = TypeDocsRemoteData(Get.find());

  TrackingModel? trackingModel;
  TypeDocsModel? typeDocsModel;

  TrackingRemoteData trackingRemoteData = TrackingRemoteData(Get.find());

  final List<String> typeTracking = [
    "Documents".tr,
    "Passports".tr,
  ];

  final List<TrackingModel> listOfDocsTracking = [];

  final List<TrackingModel> listOfPassportTracking = [];
  List<TypeDocsModel> listOfDocumentTypes = [];

  getTrackDocuments() async {
    listOfDocsTracking.clear(); // Clear previous data

    statusRequest = StatusRequest.loading;
    update();

    var response = await trackingRemoteData.postData(
      myservices.sharedPref.getInt("user_id").toString()!,
      "Documents",
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          trackingModel = TrackingModel.fromJson(userData);
          listOfDocsTracking.add(trackingModel!);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  getTrackPassports() async {
    listOfPassportTracking.clear(); // Clear previous data

    statusRequest = StatusRequest.loading;
    update();

    var response = await trackingRemoteData.postData(
      myservices.sharedPref.getInt("user_id").toString()!,
      "Passports",
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          trackingModel = TrackingModel.fromJson(userData);
          listOfPassportTracking.add(trackingModel!);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  getTypeDocs() async {
    listOfDocumentTypes.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await typeDocsRemoteData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];
        for (var userData in responseData) {
          TypeDocsModel typeDocsModel = TypeDocsModel.fromJson(userData);
          listOfDocumentTypes.add(typeDocsModel);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  convertCoastTypeDocs(type) {
    var status = listOfDocumentTypes.firstWhere(
          (status) => status.typeDocsIdId == type ,
      orElse: () =>
          TypeDocsModel(typeDocsIdId:type, typeDocsIdNameAr: "غير معروف" ,typeDocsIdNameEn: "Unknown"),
    );
    return translateDB(status.typeDocsIdNameAr  ,
        status.typeDocsIdNameEn ?? "Unknown");;
  }



  submitRating(lawyer_id,starsRate,tracking_id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await trackingRemoteData.setDataRate(
        lawyer_id.toString(),
        starsRate.toString(),
      tracking_id.toString(),
    );
    print("$response *****");//
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        print("success rating........");
        Get.snackbar("thnks".tr,"",backgroundColor: ColorApp.paw,colorText:ColorApp.caddiesSilk );
        getTrackDocuments();
        getTrackPassports();
      }else{
        Get.snackbar("thnks".tr,"",backgroundColor: ColorApp.paw,colorText:ColorApp.caddiesSilk );
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTrackDocuments();
    getTrackPassports();
    getTypeDocs();
  }
}
