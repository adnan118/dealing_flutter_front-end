import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Account/account_Controller.dart';
import '../../Controller/Home/mainScreen_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Constant/imageasset.dart';
import '../../MORE/Core/Function/alertExitApp.dart';
import '../../Widget/Home/avatarImage.dart';
import '../../Widget/Home/btnNavigationBar.dart';
import '../../Widget/Home/popupMenu.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreen_Controller mainScreen_Controller =
        Get.put(MainScreen_Controller());
    final Account_Controller accountController = Get.put(Account_Controller());


    return Obx(() => Stack(children: [
          GetBuilder<MainScreen_Controller>(
              builder: (controller) => Scaffold(
////////////////////////////////////////////////////////////////////////////////      BtnNavigationBar
                    floatingActionButton: BtnNavigationBar(
                      selectedIndex: controller.CurrentPage,
                      onTap: (int page) {
                        controller.changPage(page);
                      },
                    ),
                    floatingActionButtonLocation:
                        controller.myservices.sharedPref.getString("myLang") ==
                                "ar"
                            ? FloatingActionButtonLocation.startFloat
                            : FloatingActionButtonLocation.endFloat,
////////////////////////////////////////////////////////////////////////////////      AppBar
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: ColorApp.pureWhite,
                      toolbarHeight: 100,
                      centerTitle: true,
                      title:   AvatarImag(
                          color: Colors.transparent,
                          img:
                          "${ImageAssetApp.ImageProfile}/${accountController.imgID}",
                          radius: 45.0,
                          numCircle: 0
                      ),
                      leading: IconButton(
                        onPressed: () {
                          //  controller.isReadNotification.value = true;
                        },
                        icon: PopupMenu(
                          icon: Icons.dashboard_outlined,
                        ),
                        splashRadius: 15,
                        splashColor: ColorApp.mildBlue,
                      ),
                      actions: [
                        Obx(() => IconButton(
                          tooltip: "chatDealings".tr,
                              onPressed: () {
                                controller.toggelStausChat();
                              },
                              splashRadius: 15,
                              splashColor: ColorApp.mildBlue,
                              icon: Stack(
                                children: [
                                  Icon(Icons.chat_outlined,
                                      color: ColorApp.caddiesSilk),
                                  controller.isReadNotificationC.value
                                      ? SizedBox()
                                      : CircleAvatar(
                                          radius: 4,
                                          backgroundColor: ColorApp.darkRed,
                                        ),
                                ],
                              ),
                            )),
                        Obx(() => IconButton(
                          tooltip: "Notifications".tr,

                          onPressed: () {
                               controller.toggelStausNotification();
                               },
                              splashRadius: 15,
                              splashColor: ColorApp.mildBlue,
                              icon: Stack(
                                children: [
                                  Icon(Icons.notifications_outlined,
                                      color: ColorApp.caddiesSilk),
                                  controller.isReadNotificationN.value == true
                                      ? SizedBox()
                                      : CircleAvatar(
                                          radius: 4,
                                          backgroundColor: ColorApp.darkRed,
                                        ),
                                ],
                              ),
                            )),
                      ],
                    ),

////////////////////////////////////////////////////////////////////////////////      Body
                    body: WillPopScope(
                        child: controller.listPage
                            .elementAt(controller.CurrentPage),
                        onWillPop: () {
                          return AlertExitApp();
                        }),
                  )),
          accountController.dataUserIDOBX.isEmpty
              ? BackdropFilter(
                  child: Container(
                    child: Center(
                      child: CircularProgressIndicator(
                          color: ColorApp.caddiesSilk),
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                )
              : SizedBox(),
        ]));
  }
}
