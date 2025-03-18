import 'package:Dealings/MORE/DB/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../Controller/LoginCode/loginCode_Controller.dart';
import '../../MORE/Classes/handlingStatusRemotDataView.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Constant/imageasset.dart';
import '../../MORE/Core/Function/alertExitApp.dart';
import '../../MORE/Core/Function/validinput.dart';
import '../../Widget/Home/ResponsePadding.dart';
import '../../Widget/LoginCode/customButtomAuth.dart';
import '../../Widget/LoginCode/customTextFormAuth.dart';

class LoginCode extends StatefulWidget {
  const LoginCode({Key? key}) : super(key: key);

  @override
  State<LoginCode> createState() => _LoginCodeState();
}

class _LoginCodeState extends State<LoginCode> with TickerProviderStateMixin {
  final LoginCode_Controller controller = Get.put(LoginCode_Controller());

  double opacity = 0;
  bool isGeneratingAccount = true;
  double scale = 1;



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          opacity == 0 ? "titleAppBarrAuthLog".tr : "generateAccount".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!,
        ),
      ),
      body: WillPopScope(
        onWillPop: AlertExitApp,
    child:
    ResponsePadding( widget: _buildBody(),),

    )


    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildBackgroundImage(),
        _buildForm(),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      ImageAssetApp.verifiedImg,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: Column(
        mainAxisAlignment: opacity == 1
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.statusRequest == StatusRequest.offinternetfailuer
              ? SizedBox()
              : _buildOtpTextField(),
          Flexible(child: _buildFlexibleSpace()),
          _buildButtonsAndForms(),
        ],
      ),
    );
  }

  Widget _buildOtpTextField() {
    return GetBuilder<LoginCode_Controller>(
        builder: (logIn_Controller) => HandlingStatusRemotDataRequest(
            statusRequest: logIn_Controller.statusRequest,
            widget: Form(
                key: logIn_Controller.myKeyLoginCode,
                child: AnimatedScale(
                    scale: scale,
                    duration: Duration(seconds: 2),
                    curve: Curves.ease,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OtpTextField(
                          numberOfFields: 5,
                          focusedBorderColor: ColorApp.mildBlue,
                          borderRadius: BorderRadius.circular(20),
                          fieldWidth: 40,
                          borderColor: ColorApp.intergalactic,
                          cursorColor: ColorApp.intergalactic,
                          fillColor: ColorApp.paw,
                          readOnly: opacity == 1,
                          filled: opacity == 1,
                          showCursor: opacity == 0,
                          clearText: opacity == 1,
                          showFieldAsBox: true,
                          onCodeChanged: (String verificationCode) {
                            print(verificationCode);
                          },
                          onSubmit: (String verificationCode) {
                            logIn_Controller.login(verificationCode);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Text("forgetpassword".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      decoration: TextDecoration.underline)),
                          onTap: () => controller.forgetpassword(),
                          borderRadius: BorderRadius.circular(10),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        )
                      ],
                    )))));
  }

  Widget _buildFlexibleSpace() {
    return AnimatedFractionallySizedBox(
      duration: Duration(seconds: 1),
      heightFactor: isGeneratingAccount ? 0.5 : 0.1,
    );
  }

  Widget _buildButtonsAndForms() {
    return Column(
      children: [
        _buildToggleButton(),
        if (opacity == 1) FormGenerate(),
        _buildGenerateAccountButton(),
      ],
    );
  }

  Widget _buildToggleButton() {
    return MaterialButton(
      child: Text(
        isGeneratingAccount ? "Generateanewaccount".tr : "ihaveacode".tr,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: ColorApp.intergalactic,
              fontSize: 20,
            ),
      ),
      onPressed: _toggleForm,
      color: ColorApp.paw,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
    );
  }

  void _toggleForm() {
    setState(() {
      opacity = opacity == 1 ? 0 : 1;
      scale = scale == 1 ? 75 : 1; // عكس الحالة
      isGeneratingAccount = !isGeneratingAccount;
    });
  }

  Widget _buildGenerateAccountButton() {
    return AnimatedOpacity(
      opacity: opacity,
      curve: Curves.ease,
      duration: Duration(milliseconds: 700),
      child: CustomButtomAuth(
        text: "generateAccount".tr,
        onPressed: () {
          if (controller.createdAccount) {
            _toggleForm();
          }
          controller.generatAccount();
        },
      ),
    );
  }
}

class FormGenerate extends StatelessWidget {
  const FormGenerate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<LoginCode_Controller>(
        builder: (controller) => HandlingStatusRemotDataRequest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.myKeyLoginCodeGenerate,
            child: Column(
              children: [
                _buildNameField(controller),
                _buildPhoneField(controller),
                _buildEmailField(controller),
                _buildLocationField(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField(LoginCode_Controller controller) {
    return CustomTextFormAuth(
      title: "fildnumberphone".tr,
      hint: "09xxxxxxxx",
      icon: Icons.numbers,
      myController: controller.numberPhone,
      keyboardTypex: TextInputType.number,
      valid: (val) => validinput(val!, 10, 10, "phone"),
    );
  }

  Widget _buildEmailField(LoginCode_Controller controller) {
    return CustomTextFormAuth(
      title: "fildemail".tr,
      hint: "example@gmail.com",
      icon: Icons.alternate_email,
      myController: controller.email,
      keyboardTypex: TextInputType.text,
      valid: (val) => validinput(val!, 10, 30, "email"),
    );
  }

  Widget _buildNameField(LoginCode_Controller controller) {
    return CustomTextFormAuth(
      title: "fildusername".tr,
      hint: "fildusername",
      icon: Icons.person_pin,
      myController: controller.userName,
      keyboardTypex: TextInputType.text,
      valid: (val) => validinput(val!, 2, 15, ""),
    );
  }

  Widget _buildLocationField(LoginCode_Controller controller) {
    return CustomTextFormAuth(
      title: "fildaddress".tr,
      hint: "Damascus-Syria",
      icon: Icons.pin_drop_outlined,
      myController: controller.address,
      keyboardTypex: TextInputType.text,
      valid: (val) => validinput(val!, 1, 50, ""),
    );
  }


}
