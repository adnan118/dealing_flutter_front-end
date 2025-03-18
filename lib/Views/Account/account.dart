import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../Controller/Account/account_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../Widget/Account/listOfFrequentlyAskedQuestions.dart';
import '../../Widget/Account/listOfPersonalInfo.dart';
import '../../Widget/Account/listOfPersonalInfoDisable.dart';
import '../../Widget/Home/containerHome.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Account_Controller controller = Get.put(Account_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.pureWhite,
      body: SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: GetBuilder<Account_Controller>(
        builder: (controller) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.01, 0.2), // بدء الانيميشن من الأسفل
                    end: Offset.zero, // الوصول إلى الموضع النهائي
                  ).animate(CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.ease,
                  )),
                  child: Column(
                    children: [
                      Obx(() {
                        return Stack(children: [
                          GestureDetector(
                            child: ContainerHome(
                              title: controller.sureUpdateProfile == true
                                  ? "updateProfiletitle2".tr
                                  : "updateProfiletitle1".tr,
                              content: controller.sureUpdateProfile == true
                                  ? "updateProfilecontent2".tr
                                  : "updateProfilecontent1".tr,
                              colorBg: controller.sureUpdateProfile == true
                                  ? ColorApp.pureWhite
                                  : ColorApp.paw,
                              colorContent: controller.sureUpdateProfile == true
                                  ? ColorApp.caddiesSilk.withOpacity(0.5)
                                  : ColorApp.pureWhite,
                              titleBtn: controller.sureUpdateProfile == true
                                  ? "updateProfilebtnvMode2".tr
                                  : "updateProfilebtnvMode1".tr,
                              onPressed: () {
                                controller.sureUpdateProfile.value =
                                    !controller.sureUpdateProfile.value;
                                print(controller.sureUpdateProfile.value);
                              },
                            ),
                          ),
                          Icon(
                            Icons.person_pin_circle_outlined,
                            color: controller.sureUpdateProfile == true
                                ? ColorApp.warmGray.withOpacity(0.4)
                                : ColorApp.pureWhite.withOpacity(0.4),
                            size: 100,
                          ),
                        ]);
                      }),
                      Obx(() {
                        return controller.sureUpdateProfile == true
                            ? ListOfPersonalInfo()
                            : ListOfPersonalInfoDisable();
                      }),
                      SizedBox(height: 20),
                      Divider(thickness: 2),
                      Obx(() {
                        return GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                ContainerHome(
                                  title: "notificationSetting".tr,
                                  content: "notificationSettingStatusTitle".tr,
                                  colorBg:
                                      controller.isStopNotifications.value ==
                                              false
                                          ? ColorApp.warmGray.withOpacity(0.2)
                                          : ColorApp.mildBlue,
                                  colorContent: controller
                                              .isStopNotifications.value ==
                                          false
                                      ? ColorApp.caddiesSilk.withOpacity(0.5)
                                      : ColorApp.pureWhite,
                                  titleBtn:
                                      controller.isStopNotifications.value ==
                                              false
                                          ? "notificationStatusBtnOff".tr
                                          : "notificationStatusBtnOn".tr,
                                  onPressed: () {
                                    controller.toggleOnOffNotifications();
                                  },
                                  colorbtn:
                                      controller.isStopNotifications.value ==
                                              false
                                          ? ColorApp.warmGray
                                          : ColorApp.intergalactic,
                                ),
                                Icon(
                                  Icons.edit_notifications_outlined,
                                  color: ColorApp.pureWhite.withOpacity(0.4),
                                  size: 100,
                                ),
                              ],
                            ));
                      }),
                      SizedBox(height: 7),
                      Divider(thickness: 2),
                      SizedBox(height: 30),

                       Column(
                        children: [

                          ListOfFrequentlyAskedQuestions(),
                          Divider(),
                           ListTile(
                            title: Text("PrivacyPolicy".tr,   style: Theme
                                .of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 15,color: ColorApp.caddiesSilk)),
                            leading: Icon(Icons.privacy_tip_outlined,color: ColorApp.paw,size: 30,),
                            onTap: ()=>controller.goToPrivacyPolicy(),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
