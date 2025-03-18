import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../MORE/Classes/HandlingDataController.dart';
import '../../../MORE/Core/Localization/translateDB.dart';
import '../../../MORE/Core/Services/services.dart';
import '../../../MORE/DB/statusRequest.dart';
import '../../../MORE/Data/DataSource/Remote/cityRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/countryRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/infoLawerRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/insertReqDocsRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/reqDocsRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/transLangRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/typeDocsRemoteData.dart';
import '../../../MORE/Data/Model/cityModel.dart';
import '../../../MORE/Data/Model/lawyerModel.dart';
import '../../../MORE/Data/Model/transLangModel.dart';
import '../../../MORE/Data/Model/typeDocsModel.dart';

class RequestaDocument_Controller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCountry();
    getLawers();
    getTypeDocs();
    getCities();
    getTransLang();
    arabicName = TextEditingController();
    englishName = TextEditingController();
    birthDate = TextEditingController();
    nationalNumber = TextEditingController();
    // Check if Get.arguments is not null and contains "typeDocs"
    selectedDocumentType =
        (Get.arguments != null && Get.arguments["typeDocs"] != null)
            ? Get.arguments["typeDocs"].toString().obs
            : ''.obs;
  }

  StatusRequest statusRequest = StatusRequest.none;
  Myservices myservices = Get.find();
  GlobalKey<FormState> myKeyReqDocs = GlobalKey<FormState>();

  ReqDocsRemoteData reqDocsRemoteData = ReqDocsRemoteData(Get.find());
  TypeDocsRemoteData typeDocsRemoteData = TypeDocsRemoteData(Get.find());
  CityRemoteData cityRemoteData = CityRemoteData(Get.find());
  TransLangRemoteData transLangRemoteData = TransLangRemoteData(Get.find());
  InsertReqDocsRemoteData insertReqDocsRemoteData =
      InsertReqDocsRemoteData(Get.find());
  CountryRemoteData countryRemoteData = CountryRemoteData(Get.find());
  InfoLawerRemoteData infoLawerRemoteData = InfoLawerRemoteData(Get.find());

  // المتغيرات القابلة للمراقبة
  late TextEditingController arabicName;
  late TextEditingController englishName;
  late TextEditingController nationalNumber;
  late TextEditingController birthDate;

  var selectedDocumentType = ''.obs;
  var selectedDocumentTypeCoast = 0;
  var selectedLawyer = ''.obs;
  var selectedCountry = ''.obs;
  var selectedCity = ''.obs;
  var address = ''.obs;
  var needsTranslation = false.obs;
  var needsTranslationCoast = 0;
  var selectedTranslationLanguage = '1'.obs;
  LawyerModel? lawyerModel;
  TypeDocsModel? typeDocsModel;
  CityModel? cityModel;
  TransLangModel? transLangModel;

  List<CityModel> listOfCities = [];
  List<TypeDocsModel> listOfDocumentTypes = [];
  List<LawyerModel> listOfLawyers = [];
  List<TransLangModel> listOfTranslationLanguages = [];
  List<String> listOfCountry = [];

  getCountry() async {
    print("البدء في تحميل البيانات...");
    final response = await countryRemoteData.fetchCountryByCode();

    // في حالة النجاح
    if (response != null && response.isNotEmpty) {
      for (var country in response) {
        listOfCountry.add(country['name']['common']);
      }
    } else {
      print("لا توجد بيانات.");
    }
    update();
  }

  getLawers() async {
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

        print("Selected Lawyer ID: ${selectedLawyer.value}");
        print(
            "Available Lawyer IDs: ${listOfLawyers.map((lawyer) => lawyer.lawyrId).toList()}");
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  convertlwyerCityCode(cityCode) {
    var status = listOfCities.firstWhere(
      (status) => status.cityId == cityCode,
      orElse: () => CityModel(
          cityId: cityCode,
          cityNameAr: "غير معروف",
          cityNameEn: "Unknown Status"),
    );

    return translateDB(status.cityNameAr ?? "غير معروف",
        status.cityNameEn ?? "Unknown Status");
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

  getCities() async {
    listOfCities.clear(); // Clear previous data

    statusRequest = StatusRequest.loading;
    update();

    var response = await cityRemoteData.postData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          CityModel cityModel = CityModel.fromJson(userData);
          listOfCities.add(cityModel);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  getTransLang() async {
    listOfTranslationLanguages.clear(); // Clear previous data

    statusRequest = StatusRequest.loading;
    update();

    var response = await transLangRemoteData.postData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          TransLangModel transLangModel = TransLangModel.fromJson(userData);
          listOfTranslationLanguages.add(transLangModel);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  convertCoastTypeDocs(type) {
    var status = listOfDocumentTypes.firstWhere(
      (status) => status.typeDocsIdId == int.parse(type),
      orElse: () =>
          TypeDocsModel(typeDocsIdId: int.parse(type), typeDocsIdCoast: 0),
    );
    return status.typeDocsIdCoast;
  }

  convertCoastTranslationLanguages(lan) {
    var status = listOfTranslationLanguages.firstWhere(
      (status) => status.transLangId == int.parse(lan),
      orElse: () =>
          TransLangModel(transLangId: int.parse(lan), transLangCoast: 0),
    );
    return status.transLangCoast;
  }

  var totalCoast = 0;

  getTotal() {
    totalCoast =
        selectedDocumentTypeCoast.toInt() + needsTranslationCoast.toInt();
    print(totalCoast);
    return totalCoast;
  }

  /////////////////////
  late var docs_imgId = "avatar5.jpg";

  XFile? xfile;
  File? myfile;

  chooesImg() async {
    update();
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      myfile = File(xfile!.path);
      print(myfile);
    } else {
      print("No image selected.");
    }
    update();
  }

  sendRequestDocs() async {
    var formdata = myKeyReqDocs.currentState;

    if (formdata!.validate()) {
      if (myfile == null) {
        Get.snackbar("Error".tr, "Pleaseselectimage".tr);
        return;
      }
      if (birthDate.text == "") {
        Get.snackbar("Error".tr, "Vbirthdate".tr);
        return;
      }
      if (arabicName.text == "") {
        Get.snackbar("Error".tr, "vUsername".tr);
        return;
      }
      if (englishName.text == "") {
        Get.snackbar("Error".tr, "vUsername".tr);
        return;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await insertReqDocsRemoteData.sentDataReqDocsWithFile(
        myservices.sharedPref.getInt("user_id").toString()!,
        arabicName.text,
        englishName.text,
        nationalNumber.text,
        birthDate.text,
        selectedCity.value,
        selectedDocumentType.value,
        selectedLawyer.value,
        selectedCountry.value,
        selectedTranslationLanguage.value,
        totalCoast,
        docs_imgId,
        myfile,
      );

// تحقق من أن response ليست null
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
          Get.snackbar("Submittedsuccessfully".tr, "seeReqSubneission".tr);
          Get.toNamed("/PaymentsPage");
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
}
