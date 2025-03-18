import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../Widget/Traking/listOfTrackingType.dart';

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // عرض حالة الطلبات المقدمة
                Text(
                  "requestStatus".tr,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorApp.warmGray,fontSize: 25),
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.01, 0.2), // بدء الانيميشن من الأسفل
                    end: Offset.zero , // الوصول إلى الموضع النهائي
                  ).animate(CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.ease,
                  )),
                  child: ListOfTrackingType(),
                ),

                SizedBox(
                  height: 90,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
