import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MORE/Classes/HandlingDataController.dart';
import '../../MORE/Core/Services/services.dart';
import '../../MORE/DB/statusRequest.dart';
import '../../MORE/Data/DataSource/Remote/homeAppRemoteData.dart';
import '../../MORE/Data/Model/typeDocsModel.dart';
import 'mainScreen_Controller.dart';

abstract class HomeControllerMain extends SearchMixController {}

class Home_Controller extends HomeControllerMain {
  MainScreen_Controller mainScreen_Controllerx=Get.put(MainScreen_Controller());


  StatusRequest statusRequest = StatusRequest.none;
  Myservices myservices = Get.find();
  RxBool isReadNotification = false.obs;

  // عنوان الخدمة
  List title = [
    "Requestadocument".tr,
    "Legalconsultation".tr,
    "Requestapassport".tr
  ];
  List titleBtn = ["Requestnow".tr, "Consultnow".tr, "Requestnow".tr];
  List content = ["Rdocument".tr, "Ladvice".tr, "Rpassport".tr];
  List nameService = [
    "/RequestDocument",
    "/LegalConsultation",
    "/RequestaPassport"
  ];

  goToReqDocs(typeDocs) {
    Get.toNamed("/RequestDocument", arguments: {
      "typeDocs": typeDocs,
    });
  }
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();

  }
}

/////////////////////////
class SearchMixController extends GetxController {
  TextEditingController? searchController;

  HomeAppRemoteData homeRemoteData =
  HomeAppRemoteData(Get.find());

  late StatusRequest statusRequest = StatusRequest.success;

  List<TypeDocsModel> listdata = [];
  bool isDoingSearch = false;

  checkSearch(val) {
    if (val == "") {
      //في البداية لايقوم بالبحث
      statusRequest = StatusRequest
          .none; //عند البحث عن شي غير موجود وحذفت البحث لاتعود الصفحة مع المنتجات الا بعد هذا الاجراء
      isDoingSearch = false;
    }
    update();
  }

  onPressSearchPro() {
    //عند الضغط على زر البحث
    isDoingSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeRemoteData.getSearchData(searchController!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response["data"];
        listdata.addAll(responsedata.map((e) => TypeDocsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
