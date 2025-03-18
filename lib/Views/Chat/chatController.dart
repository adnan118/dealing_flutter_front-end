import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MORE/Core/Services/services.dart';
import 'app_service.dart';

class AppController extends GetxController {
  final AppService appService;
  Myservices myservices = Get.find();

  AppController(this.appService);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController   msgController ;
  late var imgID = myservices.sharedPref.getString("user_img").toString()!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loginUser(myservices.sharedPref!.getString("user_email").toString(),'123456789');
    getCurrentChats();
    msgController = TextEditingController();
  // imgID =myservices.sharedPref.getString("user_img").toString()!;
    print(myservices.sharedPref.getString("user_img"));
  }
  Future<void> submit(AppService appService,String userId) async {
    final text = msgController.text;
    if (text.isEmpty) {      return;    }
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final appService = Get.find<AppService>();
      await appService.saveMessage(text, userId);
      msgController.text = '';
      update();   }  }




  void createUsers(useremail,usercode,username) async {
    await appService.createUsers(useremail,usercode,username);
    update(); // تحديث الواجهة
  }

  void loginUser(useremail,usercode) async {
    await appService.signIn(useremail,usercode);
    update(); // تحديث الواجهة
  }

  void signOut() async {
    await appService.signOut();
    update(); // تحديث الواجهة
  }

  bool isAuthenticated() => appService.isAuthentificated();
  String getCurrentUserEmail() => appService.getCurrentUserEmail();

//  List<Map<String, dynamic>> currentChats = []; // قائمة المحادثات الجارية
  var currentChats = <Map<String, dynamic>>[].obs; // استخدام RxList

// دالة لجلب المحادثات الجارية

  Future<List<Map<String, dynamic>>> getCurrentChats() async {
    // هنا يمكنك إضافة منطق لجلب المحادثات من قاعدة البيانات
    return currentChats; // تأكد من أن currentChats هي RxList
  }


}