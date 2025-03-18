import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // لتحديد وقت العرض
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../Controller/Account/account_Controller.dart';
import '../../Controller/Traking/traking_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Function/validinput.dart';
import '../LoginCode/customTextFormAuth.dart';

class ListOfPersonalInfoDisable extends StatefulWidget {
  const ListOfPersonalInfoDisable({Key? key}) : super(key: key);

  @override
  State<ListOfPersonalInfoDisable> createState() =>
      _ListOfPersonalInfoDisableState();
}

class _ListOfPersonalInfoDisableState extends State<ListOfPersonalInfoDisable>
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
      begin: const Offset(1.0, 0.0), // ابدأ من الجانب الأيمن
      end: Offset.zero, // الوصول إلى الموضع الأصلي
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCirc,
    ));

    // بدء الانيميشن عند تحميل الويدجت
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
        child: Neumorphic(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            style: NeumorphicStyle(
              color: ColorApp.warmGray.withOpacity(0.3),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              depth: 1,
            ),
            child: Column(
              children: [
                ViewInfo(
                  icon: controller.iconsInfo[0],
                  mytitle: controller.userModel!.userName.toString(),
                ),
                ViewInfo(
                  icon: controller.iconsInfo[1],
                  mytitle: controller.userModel!.userLocation.toString(),
                ),
                ViewInfo(
                  icon: controller.iconsInfo[2],
                  mytitle: controller.userModel!.userEmail.toString(),
                ),
                ViewInfo(
                  icon: controller.iconsInfo[3],
                  mytitle: controller.userModel!.userPhone.toString(),
                )
              ],
            )));
  }
}

class ViewInfo extends StatelessWidget {
  final IconData icon;
  final String mytitle;

  const ViewInfo({Key? key, required this.icon, required this.mytitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        child: Neumorphic(
          margin: EdgeInsets.symmetric(vertical: 15),
          style: NeumorphicStyle(
            color: ColorApp.pureWhite,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 1,
          ),
          child: ExpansionTileCard(
            expandedTextColor: ColorApp.intergalactic,
            turnsCurve: Curves.fastOutSlowIn,
            animateTrailing: false,
            initiallyExpanded: false,
            duration: const Duration(milliseconds: 500),
            expandedColor: ColorApp.pureWhite.withOpacity(0.8),
            trailing: Icon(
              icon,
            ),
            title: Text(
              mytitle,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 15, color: ColorApp.caddiesSilk),
            ),
            children: [],
          ),
        ));
  }
}
