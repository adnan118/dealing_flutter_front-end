import 'package:flutter/material.dart';import 'package:get/get.dart';

 import '../../Controller/Payments/payments_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../Widget/Payments/listOfPayments.dart';


class PaymentsPage extends StatefulWidget {
  @override _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> with SingleTickerProviderStateMixin {
  final Payments_Controller controller = Get.put(Payments_Controller());
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
    @override Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Payments'.tr),
          backgroundColor: ColorApp.caddiesSilk,
          shape: RoundedRectangleBorder(
              borderRadius:
              controller.myservices.sharedPref.getString("myLang") == "ar"
                  ? BorderRadius.only(bottomRight: Radius.circular(50))
                  : BorderRadius.only(bottomLeft: Radius.circular(50))),
        ),      backgroundColor: ColorApp.pureWhite,

        body:

        SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                    "Payments".tr,
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
                    child: ListOfPayments(),
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




