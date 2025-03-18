import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../MORE/Classes/HandlingDataController.dart';
import '../../MORE/Core/Services/services.dart';
import '../../MORE/DB/statusRequest.dart';
import '../../MORE/Data/DataSource/Remote/infoUserRemoteData.dart';
import '../../MORE/Data/Model/userModel.dart';

class Account_Controller extends GetxController {
  Myservices myservices = Get.find();
  RxBool sureUpdateProfile = false.obs;
  StatusRequest statusRequest = StatusRequest.none;
  InfoUserRemoteData infoUserRemoteData = InfoUserRemoteData(Get.find());
  GlobalKey<FormState> myKeyAccount = GlobalKey<FormState>();

  RxBool isShowPassword = true.obs;
  RxBool isStopNotifications = false.obs;

  UserModel? userModel;
  List<UserModel> dataUserID = [];
  RxList<UserModel> dataUserIDOBX = <UserModel>[].obs; // for Home page

  final List dataUserID1 = [
    "Hadi Marouf Alattal",
    "Hama - Andalusia, Syria",
    "hadialattal@gmail.com",
    "0996183101",
    "had&12#15",
  ];

  final List<IconData> iconsInfo = [
    Icons.person_pin,
    Icons.pin_drop_outlined,
    Icons.alternate_email,
    Icons.numbers,
  ];
  late TextEditingController numberPhone;
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController address;
  IconData IconDataPassword = Icons.lock_outline;

  funShowPassword() {
    isShowPassword.value = isShowPassword.value == true ? false : true;
    IconDataPassword = IconDataPassword == Icons.lock_open
        ? Icons.lock_outline
        : Icons.lock_open;
    update();
  }

  final List<Map<String, String>> listFrequentlyAskedQuestions = [
    {
      "question": "متى يبدأ العمل على طلبي؟",
      "answer": "بدأ العمل على طلبك بعد التحقق من الدفعة."
    },
    {
      "question": "متى يصلني طلبي؟",
      "answer":
          "سيصل طلبك عبر شركة الشحن المختارة إذا كنت داخل القطر، أو يمكن تسليمه باليد، أو عن طريق شركة الشحن الداخلي في حال كنت داخل القطر."
    },
    {
      "question": "متى يحق لي إلغاء طلبي ودفعتي؟",
      "answer":
          "يحق لك إلغاء الطلب في أي وقت قبل الدفع، وأيضًا بعد الدفع. \nومع ذلك، لا يُسمح باسترجاع المبلغ المدفوع بعد إتمام عملية الدفع."
    },
    {
      "question": "متى يبدأ العمل على طلبي؟",
      "answer": "بدأ العمل على طلبك بعد التحقق من الدفعة."
    },
    {
      "question":
          "اذا أفعل في حال انسحاب المحامي أو عدم قدرة المعاملات على إنجاز طلبي؟",
      "answer":
          "مكنك التواصل مع قسم الدعم للحصول على المساعدة في اختيار محامٍ آخر لإكمال إجراءات طلبك."
    },
    {
      "question": "هل الاجابات في الاستشارة القانونية موثوقة",
      "answer": "نعم,لايسمح الا للمختصين بالاجابة."
    },
  ];
  final List<Map<String, String>> listPrivacyPolicy = [
    {
      "title": "titlePP1".tr,
      "subtitle": "subPP1".tr,
    },
    {
      "title": "titlePP2".tr,
      "subtitle": "subPP2".tr,
    },
    {
      "title": "titlePP3".tr,
      "subtitle": "subPP3".tr,
    },
    {
      "title": "titlePP4".tr,
      "subtitle": "subPP4".tr,
    },
    {
      "title": "titlePP5".tr,
      "subtitle": "subPP5".tr,
    },
    {
      "title": "titlePP6".tr,
      "subtitle": "subPP6".tr,
    },
    {
      "title": "footerPPT".tr,
      "subtitle": "footerPPS".tr,
    },
  ];

  getinfoUserID() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await infoUserRemoteData.postData(
      myservices.sharedPref.getInt("user_id").toString()!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];

        for (var userData in responseData) {
          userModel = UserModel.fromJson(userData);
          dataUserID.add(userModel!);
          dataUserIDOBX.add(userModel!);
        }

        userName = TextEditingController(text: userModel!.userName);
        address = TextEditingController(text: userModel!.userLocation);
        email = TextEditingController(text: userModel!.userEmail);
        numberPhone = TextEditingController(text: userModel!.userPhone);
        imgID = userModel!.userImg!;
      } else {
        statusRequest = StatusRequest.failuer;
        exit(0);
      }
    }
    update();
    //////
  }

  late var imgID = "ximg.png";
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

  setinfoUserID() async {
    var formdata = myKeyAccount.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (myfile == null) {
        response = await infoUserRemoteData.setDataWithoutFile(
          myservices.sharedPref.getInt("user_id").toString()!,
          userName.text,
          address.text,
          email.text,
          numberPhone.text,
          imgID,
        );
      } else {
        response = await infoUserRemoteData.setData(
          myservices.sharedPref.getInt("user_id").toString()!,
          userName.text,
          address.text,
          email.text,
          numberPhone.text,
          imgID,
          myfile,
        );
      }

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          getinfoUserID();
          sureUpdateProfile.value = false;
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

  toggleOnOffNotifications() {
    isStopNotifications.value = !isStopNotifications.value;
    myservices.sharedPref
        ?.setBool("ONOFFNotifications", isStopNotifications.value);
    isStopNotifications.value =
        myservices.sharedPref.getBool("ONOFFNotifications")!;
    print("ONOFFNotifications");
    print(isStopNotifications.value);
    update();
  }
  goToPrivacyPolicy() {
    Get.toNamed("/PrivacyPolicy");
  }

  @override
  void onInit() {
    getinfoUserID();
    numberPhone = TextEditingController();
    email = TextEditingController();
    userName = TextEditingController();
    address = TextEditingController();
    isStopNotifications =
        (myservices.sharedPref.getBool("ONOFFNotifications") ?? false).obs;

    super.onInit();
  }
}
