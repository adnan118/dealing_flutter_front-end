import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Account/account_Controller.dart';
import '../../MORE/Core/Constant/color.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({Key? key}) : super(key: key);
  Account_Controller controller = Get.put(Account_Controller());

  @override
  Widget build(BuildContext context) {
    Widget _buildPolicySection(String title, String content) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 16, color: ColorApp.paw),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 13),
          ),
          const SizedBox(height: 12),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("PrivacyPolicy".tr),
        backgroundColor: ColorApp.caddiesSilk,
        shape: RoundedRectangleBorder(
            borderRadius:
                controller.myservices.sharedPref.getString("myLang") == "ar"
                    ? BorderRadius.only(bottomRight: Radius.circular(50))
                    : BorderRadius.only(bottomLeft: Radius.circular(50))),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/More/PrivacyPolicy.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/LogoApp/dealingsOnlyImg.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.listPrivacyPolicy.length,
                itemBuilder: ((context, index) {
                  return _buildPolicySection(
                    "${controller.listPrivacyPolicy[index]["title"]}",
                    "${controller.listPrivacyPolicy[index]["subtitle"]}",
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
