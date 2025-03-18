import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../Controller/Account/account_Controller.dart';
import '../../MORE/Classes/handlingStatusRemotDataView.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Constant/imageasset.dart';
import '../../MORE/Core/Function/validinput.dart';
import '../Home/avatarImage.dart';
import '../Home/customButtomHome.dart';
import '../LoginCode/customTextFormAuth.dart';

class ListOfPersonalInfo extends StatefulWidget {
  const ListOfPersonalInfo({Key? key}) : super(key: key);

  @override
  State<ListOfPersonalInfo> createState() => _ListOfPersonalInfoState();
}

class _ListOfPersonalInfoState extends State<ListOfPersonalInfo>
    with SingleTickerProviderStateMixin {
  final Account_Controller controller = Get.put(Account_Controller());
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCirc,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation,
        child: Form(
            key: controller.myKeyAccount,
            child: Neumorphic(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                style: NeumorphicStyle(
                  color: ColorApp.warmGray.withOpacity(0.3),
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  depth: 1,
                ),
                child: GetBuilder<Account_Controller>(
                    builder: (controller) => HandlingStatusRemotDataRequest(
                          statusRequest: controller.statusRequest,
                          widget: Column(
                            children: [
                              CustomTextFormAuth(
                                title: "fildusername".tr,
                                hint: "${controller.userModel!.userName!}",
                                icon: controller.iconsInfo[0],
                                myController: controller.userName,
                                keyboardTypex: TextInputType.text,
                                valid: (val) =>
                                    validinput(val!, 2, 25, "username1"),
                              ),
                              CustomTextFormAuth(
                                title: "fildaddress".tr,
                                hint: "${controller.userModel!.userLocation}",
                                icon: controller.iconsInfo[1],
                                myController: controller.address,
                                keyboardTypex: TextInputType.text,
                                valid: (val) => validinput(val!, 5, 50, ""),
                              ),
                              CustomTextFormAuth(
                                title: "fildemail".tr,
                                hint: "${controller.userModel!.userEmail}",
                                icon: controller.iconsInfo[2],
                                myController: controller.email,
                                keyboardTypex: TextInputType.emailAddress,
                                valid: (val) =>
                                    validinput(val!, 10, 30, "email"),
                              ),
                              CustomTextFormAuth(
                                title: "fildnumberphone".tr,
                                hint: "${controller.userModel!.userPhone}",
                                icon: controller.iconsInfo[3],
                                myController: controller.numberPhone,
                                keyboardTypex: TextInputType.number,
                                valid: (val) =>
                                    validinput(val!, 10, 10, "phone"),
                              ),
                              Obx(() {
                                return controller.sureUpdateProfile == true
                                    ? Neumorphic(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5),
                                        style: NeumorphicStyle(
                                          color: ColorApp.warmGray
                                              .withOpacity(0.3),
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(20)),
                                          depth: 1,
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              controller.chooesImg();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                controller.myfile == null
                                                    ? AvatarImag(
                                                        color:
                                                            Colors.transparent,
                                                        img:
                                                            "${ImageAssetApp.ImageProfile}/${controller.imgID}",
                                                        radius: 30.0,
                                                        numCircle: 0)
                                                    : CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            FileImage(controller
                                                                .myfile!),
                                                        radius: 30.0,
                                                      ),
                                                Icon(
                                                  Icons.add_a_photo_outlined,
                                                  color: ColorApp.caddiesSilk,
                                                ),
                                              ],
                                            )))
                                    : SizedBox();
                              }),
                              Container(
                                alignment: Alignment.center,
                                child: customButtomHome(
                                  onPressed: () => controller.setinfoUserID(),
                                  text: "Save".tr,
                                  color: ColorApp.intergalactic,
                                ),
                              ),
                            ],
                          ),
                        )))));
  }
}
