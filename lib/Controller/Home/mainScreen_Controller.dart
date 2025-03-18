import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MORE/Classes/HandlingDataController.dart';
import '../../MORE/Core/Services/services.dart';
import '../../MORE/DB/statusRequest.dart';
import '../../MORE/Data/DataSource/Remote/countryRemoteData.dart';
import '../../MORE/Data/DataSource/Remote/notificationsRemoteData.dart';
import '../../MORE/Data/Model/notificationsModel.dart';
import '../../Views/Account/account.dart';
import '../../Views/Chat/app_service.dart';
import '../../Views/Chat/chatController.dart';
import '../../Views/Home/home.dart';
import '../../Views/Tracking/tracking.dart';


class MainScreen_Controller extends GetxController {
  final AppService appService = Get.find<AppService>();
  AppController appController = Get.put(AppController(AppService()));
  StatusRequest statusRequest = StatusRequest.none;
  Myservices myservices = Get.find();
  RxBool isReadNotificationN = false.obs;
  RxBool isReadNotificationC = true.obs;
  int CurrentPage = 0;
  List<Widget> listPage = [
    Home(),
    Tracking(),
    Account(),
  ];
  void toggelStausNotification(){
    checkNoteReadAll();
    getNotifications();
    Get.toNamed("/Notifications");
    update();
  }
  void toggelStausChat(){
     Get.toNamed("/UsersListPage");
    update();
  }
  @override
  changPage(int page) {
    CurrentPage = page;
    update();
  }
  logOutExit() {
    Get.offAllNamed("/Language");
    //الغاء الاشتراك بالاشعارات
    // اشعار للكل
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // اشعار لمستخدم معين
    String userId =
    myservices.sharedPref.getInt("users_id").toString()!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userId}");

    myservices.sharedPref.clear();
    appController.signOut  ();

    print("Log out");
  }

  goToPayments(){
    Get.toNamed("/PaymentsPage");
  }
  goToMainScreen(){
    Get.offAllNamed("/MainScreen");
  }


  //////////////////////////////////////////Notifications
  //////////////////////////////////////////
  //////////////////////////////////////////
  //////////////////////////////////////////

  NotificationsRemoteData notificationsRemoteData =
  NotificationsRemoteData(Get.find());
   NotificationsModel? notificationsModel;
  List<NotificationsModel> listOfNotifications = [];


  void checkNoteReadAll(){
    for(int i=0;i<=listOfNotifications.length-1;i++){
      if(listOfNotifications[i].notificationRead==0){ isReadNotificationN.value = false ; break;}
      else{ isReadNotificationN.value = true;}

    }
  }
  void getNotifications() async {
    listOfNotifications.clear(); // Clear previous data
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsRemoteData.postData(
      myservices.sharedPref.getInt("user_id").toString()!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          notificationsModel = NotificationsModel.fromJson(userData);
          listOfNotifications.add(notificationsModel!);
         }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  void setResdNotifications(notification_id,page) async {
    var response = await notificationsRemoteData.postDataRead(
        myservices.sharedPref.getInt("user_id").toString()!,
        notification_id.toString()
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(page);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit()  {
          getNotifications();
          checkNoteReadAll();
    super.onInit();
  }
}