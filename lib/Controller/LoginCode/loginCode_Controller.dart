import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MORE/Classes/HandlingDataController.dart';
import '../../MORE/Core/Function/checkInternet.dart';
import '../../MORE/Core/Services/services.dart';
import '../../MORE/DB/statusRequest.dart';
import '../../MORE/Data/DataSource/Remote/generateRemoteData.dart';
import '../../MORE/Data/DataSource/Remote/loginRemoteData.dart';
import '../../Views/Chat/app_service.dart';
import '../../Views/Chat/chatController.dart';

class LoginCode_Controller extends GetxController {
  final AppService appService = Get.find<AppService>();
  AppController appController = Get.put(AppController(AppService()));


  GlobalKey<FormState> myKeyLoginCode = GlobalKey<FormState>();
  GlobalKey<FormState> myKeyLoginCodeGenerate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  LoginRemoteData loginRemoteData = LoginRemoteData(Get.find());
  GenerateRemoteData generateRemoteData = GenerateRemoteData(Get.find());
  Myservices myservices = Get.find();
  late TextEditingController numberPhone;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController address;

  bool isShowPassword = true;
  bool createdAccount = false;
  IconData IconDataPassword = Icons.lock_outline;

  funShowPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    IconDataPassword = IconDataPassword == Icons.lock_open
        ? Icons.lock_outline
        : Icons.lock_open;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    ChINternet();
    numberPhone = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    userName = TextEditingController();
    address = TextEditingController();
  }
  void createUsers(useremail,usercode,username) async {

    await appService.createUsers(useremail,usercode,username);
    update(); // تحديث الواجهة
  }
  generatAccount() async {
    var formdata = myKeyLoginCodeGenerate.currentState;
    if (formdata!.validate()) {
      //loading
      statusRequest = StatusRequest.loading;
      update();
      var response = await generateRemoteData.postData(
        userName.text,
        numberPhone.text,
        email.text,
        address.text,
      );
      print("$response *****");
      //
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          appController.createUsers  (email.text,'123456789',userName.text);
       Get.offAllNamed("/LoginCode");
        } else {
          Get.defaultDialog(
              title: "Error", middleText: "Email or Phone already exists ");
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
      print("Data valid");
    } else {
      print("Data not valid");
    }
  }

  forgetpassword() {
    Get.toNamed("/ForgetMyCode");
  }

  login(verificationCode) async {
    var formdata = myKeyLoginCode.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginRemoteData.postData(verificationCode);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myservices.sharedPref.setInt("user_id", response['data']["user_id"]);
          myservices.sharedPref
              .setString("user_name", response['data']["user_name"]);
          myservices.sharedPref
              .setString("user_location", response['data']["user_location"]);
          myservices.sharedPref
              .setString("user_email", response['data']["user_email"]);
          myservices.sharedPref
              .setString("user_phone", response['data']["user_phone"]);
          myservices.sharedPref
              .setString("user_img", response['data']["user_img"]);
          myservices.sharedPref.setString("step", "2"); //لاجل حفظ صفحة اللغات
          // اشعار للكل
          FirebaseMessaging.instance.subscribeToTopic("users");
          // اشعار لمستخدم معين
          String userId = myservices.sharedPref.getInt("user_id").toString()!;
          FirebaseMessaging.instance.subscribeToTopic("users$userId");
          print("users$userId");
          myservices.sharedPref.setString("step", "2"); //لاجل حفظ صفحة اللغات

          appController.loginUser (email.text,'123456789');
          Get.offNamed("/MainScreen");

        } else {
          Get.defaultDialog(title: "Error".tr, middleText: "Errortitle".tr);
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
      //////
      print("Data valid");
    } else {
      print("Data not valid");
    }
  }

  var res;

  void ChINternet() async {
    //check internet
    res = await checkInternet();
    print("internet connect:");
    print(res);
  }
}
