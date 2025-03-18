import 'dart:io';

import 'package:Dealings/MORE/Data/Model/nationalityModel.dart';
import 'package:Dealings/MORE/Data/Model/typePassportModel.dart';
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
import '../../../MORE/Data/DataSource/Remote/insertReqPassportsRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/nationalityRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/placePassportRcveRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/relationRemoteData.dart';
import '../../../MORE/Data/DataSource/Remote/typePassportRemoteData.dart';
import '../../../MORE/Data/Model/cityModel.dart';
import '../../../MORE/Data/Model/lawyerModel.dart';
import '../../../MORE/Data/Model/placeRcvModel.dart';
import '../../../MORE/Data/Model/relationModel.dart';

class RequestaPassport_Controller extends GetxController {
  @override
  void onInit() {
    getTypePassport();
    getRelation();
    getNationality();
    getLawers();
    getCountry();
    getCities();
    getPlaceRcv();
    // TODO: implement onInit
    super.onInit();
    arabicName = TextEditingController();
    englishName = TextEditingController();
    birthDate = TextEditingController();
    nationalNumber = TextEditingController();
    fatherNameArabic = TextEditingController();
    fatherNameEnglish = TextEditingController();
    motherNameArabic = TextEditingController();
    motherNameEnglish = TextEditingController();
    birthPlaceArabic = TextEditingController();
    birthPlaceEnglish = TextEditingController();
    OldpassportDate = TextEditingController(text: "");
    OldpassportExpiryDate = TextEditingController(text: "");
    Oldpassportnumber = TextEditingController(text: "");
    surnameEnglish = TextEditingController();
    surnameArabic = TextEditingController();
  }

  StatusRequest statusRequest = StatusRequest.none;
  Myservices myservices = Get.find();
  final GlobalKey<FormState> myKeyReqPassport = GlobalKey<FormState>();

  // المتغيرات القابلة للمراقبة
  late TextEditingController arabicName;
  late TextEditingController fatherNameArabic;
  late TextEditingController motherNameArabic;
  late TextEditingController surnameArabic;
  late TextEditingController englishName;
  late TextEditingController fatherNameEnglish;
  late TextEditingController motherNameEnglish;
  late TextEditingController surnameEnglish;
  late TextEditingController birthPlaceArabic;
  late TextEditingController birthPlaceEnglish;
  late TextEditingController birthDate;
  late TextEditingController OldpassportDate;
  late TextEditingController OldpassportExpiryDate;
  late TextEditingController Oldpassportnumber;
  late TextEditingController nationalNumber;
  var selectedLawyer = '1'.obs;
  var selectedRelation = ''.obs;
  var selectedGender = 'male'.obs;
  var oldpassport = false.obs;
  var selectedNationality = ''.obs;
  var selectedTypePassport = ''.obs;
  var selectedTypePassportCoast = 0;
  var selectedPlacePassportRiciveCoast = 0;
  var selectedPlacePassportRicive = ''.obs;

  CountryRemoteData countryRemoteData = CountryRemoteData(Get.find());
  InfoLawerRemoteData infoLawerRemoteData = InfoLawerRemoteData(Get.find());
  NationalityRemoteData nationalityRemoteData =
      NationalityRemoteData(Get.find());
  RelationRemoteData relationRemoteData = RelationRemoteData(Get.find());
  TypePassportRemoteData typePassportRemoteData =
      TypePassportRemoteData(Get.find());
  InsertReqPassportsRemoteData insertReqPassportsRemoteData =
      InsertReqPassportsRemoteData(Get.find());
  CityRemoteData cityRemoteData = CityRemoteData(Get.find());
  PlacePassportRcveRemoteData placePassportRcveRemoteData =
      PlacePassportRcveRemoteData(Get.find());

  PlaceRcvModel? placeRcvModel;
  LawyerModel? lawyerModel;
  NationalityModel? nationalityModel;
  RelationModel? relationModel;
  TypePassportModel? typePassportModel;
  CityModel? cityModel;

  List<CityModel> listOfCities = [];
  List<LawyerModel> listOfLawyers = [];
  List<String> listOfCountry = [];
  List<NationalityModel> listOfNationality = [];
  List<RelationModel> listOfRelation = [];
  List<TypePassportModel> listOfTypePassport = [];
  List<PlaceRcvModel> listOfPlacePassportRicive = [];

  void getCountry() async {
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

        print("Selected Lawyer ID: ${selectedLawyer.value}");
        print(
            "Available Lawyer IDs: ${listOfLawyers.map((lawyer) => lawyer.lawyrId).toList()}");
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  void getNationality() async {
    listOfNationality.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await nationalityRemoteData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];
        for (var userData in responseData) {
          nationalityModel = NationalityModel.fromJson(userData);
          listOfNationality.add(nationalityModel!);
          print(nationalityModel!.nationalityNameEn);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  void getRelation() async {
    listOfRelation.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await relationRemoteData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];
        for (var userData in responseData) {
          relationModel = RelationModel.fromJson(userData);
          listOfRelation.add(relationModel!);
          print(relationModel!.relationNameEn);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  void getTypePassport() async {
    listOfTypePassport.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await typePassportRemoteData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];
        for (var userData in responseData) {
          typePassportModel = TypePassportModel.fromJson(userData);
          listOfTypePassport.add(typePassportModel!);
          print(typePassportModel!.typePassportNameEn);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  void getCities() async {
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

  void getPlaceRcv() async {
    listOfPlacePassportRicive.clear(); // Clear previous data

    statusRequest = StatusRequest.loading;
    update();

    var response = await placePassportRcveRemoteData.postData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          placeRcvModel = PlaceRcvModel.fromJson(userData);
          listOfPlacePassportRicive.add(placeRcvModel!);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  convertCoastTypePassports(type) {
    var status = listOfTypePassport.firstWhere(
      (status) => status.typePassportId == int.parse(type),
      orElse: () => TypePassportModel(
          typePassportId: int.parse(type), typePassportCoast: 0),
    );
    return status.typePassportCoast;
  }

  convertCoastPlacePassportRicive(place) {
    var status = listOfPlacePassportRicive.firstWhere(
      (status) => status.placeRcvId == int.parse(place),
      orElse: () =>
          PlaceRcvModel(placeRcvId: int.parse(place), placeRcvCoast: 0),
    );
    return status.placeRcvCoast;
  }

  var totalCoast = 0;

  getTotal() {
    totalCoast = selectedTypePassportCoast.toInt() +
        selectedPlacePassportRiciveCoast.toInt();
    print(totalCoast);
    return totalCoast;
  }

  /////////////////////
  late var passports_imgid = "avatar5.jpg";

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

  sendRequestPassport() async {
    var formdata = myKeyReqPassport.currentState;

    if (formdata!.validate()) {
      if (myfile == null) {
        Get.snackbar("Error".tr, "Pleaseselectimage".tr);
        return;
      }

      if (birthDate.text == "") {
        Get.snackbar("Error".tr, "Vbirthdate".tr);
        return;
      }
      if (OldpassportExpiryDate.text == "" && oldpassport == true.obs) {
        Get.snackbar("Error".tr, "Oldpassportexpirydate".tr);
        return;
      }
      if (OldpassportDate.text == "" && oldpassport == true.obs) {
        Get.snackbar("Error".tr, "Oldpassportissuedate".tr);
        return;
      }

      statusRequest = StatusRequest.loading;
      update();
      var response =
          await insertReqPassportsRemoteData.sentDataReqPassportsWithFile(
        myservices.sharedPref.getInt("user_id").toString()!,
        selectedRelation.value,
        arabicName.text,
        englishName.text,
        surnameArabic.text,
        surnameEnglish.text,
        fatherNameArabic.text,
        fatherNameEnglish.text,
        motherNameArabic.text,
        motherNameEnglish.text,
        selectedNationality.value,
        selectedGender.value,
        birthDate.text,
        birthPlaceArabic.text,
        birthPlaceEnglish.text,
        selectedTypePassport.value,
        selectedPlacePassportRicive.value,
        nationalNumber.text,
        Oldpassportnumber.text,
        OldpassportDate.text,
        OldpassportExpiryDate.text,
        passports_imgid,
        oldpassport.value == true ? 1 : 0,
        selectedLawyer.value,
        totalCoast,
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
