import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/LoginCode/forgetMyCode_Controller.dart';
import '../../MORE/Classes/handlingStatusRemotDataView.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Constant/imageasset.dart';
import '../../MORE/Core/Function/validinput.dart';
import '../../Widget/Home/customButtomHome.dart';
import '../../Widget/LoginCode/customTextFormAuth.dart';

class ForgetMyCode extends StatelessWidget {
  ForgetMyCode({Key? key}) : super(key: key);
  ForgetMyCode_Controller controller = Get.put(ForgetMyCode_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,iconTheme: IconThemeData(color: ColorApp.caddiesSilk),
    elevation: 0,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: Form(
              key: controller.myKeyF,
              child: Stack(children: [
               _buildBackgroundImage(),


                GetBuilder<ForgetMyCode_Controller>(
                    builder: (controller) =>
                        HandlingStatusRemotDataRequest(
                            statusRequest: controller.statusRequest,
                            widget: Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "bodyFP".tr,
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .displayLarge!.copyWith(fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 250,
                                      ),
                                      CustomTextFormAuth(
                                        title: "fildemail".tr,
                                        hint: "user@example.com",
                                        icon: Icons.alternate_email,
                                        myController: controller.chKemail,
                                        keyboardTypex: TextInputType.text,
                                        obscureText: false,
                                        valid: (val) {
                                          return validinput(val!, 10, 30,
                                              "email");
                                        },
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      customButtomHome(
                                        text: "ChickEmailbtnFB".tr,
                                        onPressed: () {
                                          controller.checkEmail();
                                        },

                                      ),
                                    ]
                                )
                            )
                        )
                )


              ]))),
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormAuth(
      title: "fildemail".tr,
      hint: "example@gmail.com",
      icon: Icons.alternate_email,
      myController: controller.chKemail,
      keyboardTypex: TextInputType.text,
      valid: (val) => validinput(val!, 20, 30, "email"),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      ImageAssetApp.Forgotpassword1,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
