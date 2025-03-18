import 'package:Dealings/Widget/Notifications/listOfNotifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Home/mainScreen_Controller.dart';
import '../../MORE/Core/Constant/color.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
   late AnimationController _animationController;
  final MainScreen_Controller controller =
      Get.put(MainScreen_Controller());

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'.tr),
        backgroundColor: ColorApp.caddiesSilk,
        shape: RoundedRectangleBorder(
            borderRadius:
                controller.myservices.sharedPref.getString("myLang") == "ar"
                    ? BorderRadius.only(bottomRight: Radius.circular(50))
                    : BorderRadius.only(bottomLeft: Radius.circular(50))),
      ),
      backgroundColor: ColorApp.pureWhite,
      body: SingleChildScrollView(
        // إضافة SingleChildScrollView
        child: Padding(
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
                  child:          ListOfNotifications(),

                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
