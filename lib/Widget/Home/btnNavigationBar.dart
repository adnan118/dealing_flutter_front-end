
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../MORE/Core/Constant/color.dart';

class BtnNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;

  const BtnNavigationBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorApp.pureWhite,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 2))
          ]),
      child:  BottomBar(
        height: 75,
        selectedIndex: selectedIndex,
        onTap: onTap,
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Padding(
              child: Image.asset("assets/images/Bar/home.png",
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            title: Text('Dealing'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 13, color: ColorApp.mildBlue)),
            activeColor: ColorApp.mildBlue,
          ),
          BottomBarItem(
            icon:
            Padding(
              child: Image.asset("assets/images/Bar/tracking.png",
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),

            title: Text('Tracking'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 13, color: ColorApp.mildBlue)),
            activeColor: ColorApp.mildBlue,
          ),
          BottomBarItem(
            icon:
            Padding(
              child: Image.asset("assets/images/Bar/account.png",
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            title: Text('Account'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 13, color: ColorApp.mildBlue)),
            activeColor: ColorApp.mildBlue,
          ),
        ],

      ),
    );
  }
}
