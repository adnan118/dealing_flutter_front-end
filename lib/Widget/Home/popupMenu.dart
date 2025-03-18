import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Home/mainScreen_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Localization/changelocal.dart';

class PopupMenu extends StatelessWidget {
  final IconData icon;

  const PopupMenu({
    Key? key, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreen_Controller controller = Get.put(MainScreen_Controller());
    controller.myservices = Get.find();
    return PopupMenuButton<String>(
      color: ColorApp.pureWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      position: PopupMenuPosition.under,
      tooltip: "moreTools".tr,
      onSelected: (value) {
        if (value == "Payments") {
          controller.goToPayments();
        } else if (value == "Languages") {
        } else if (value == "Log out") {
          controller.logOutExit();
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.payments_outlined,color: ColorApp.warmGray),
              title: Text(
                "Payments".tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            value: "Payments",
          ),
          PopupMenuItem(
            child: InkWell(
              onTap: () {
                LocalController localController = Get.put(LocalController());
                localController.changeLanguage(
                    controller.myservices.sharedPref.getString("myLang") == "ar"
                        ? "en"
                        : "ar");
                controller.goToMainScreen();
              },
              child: ListTile(
                leading: Icon(Icons.language,color: ColorApp.warmGray),
                title: Text(
                  "Languages".tr,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "languCurrent".tr,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      controller.myservices.sharedPref.getString("myLang") ==
                              "ar"
                          ? "عربي"
                          : "English",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
            value: "Languages",
          ),
          PopupMenuItem(
            child: ListTile(
              leading:Icon(Icons.output,color: ColorApp.warmGray),
              title: Text(
                "Logout".tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            value: "Log out",
          ),
        ];
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Icon(icon,color: ColorApp.caddiesSilk,),
      ),
    );
  }
}
