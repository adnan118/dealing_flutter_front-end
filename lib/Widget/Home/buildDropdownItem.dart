import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MORE/Core/Constant/color.dart';
import '../RequestDocs/customTextFormReqDocs.dart';

class buildDropdownItem extends StatelessWidget {
 final String text;
  const buildDropdownItem({Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 35,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          overflow: TextOverflow.fade,
          color: ColorApp.caddiesSilk,
          fontSize: 14,
        ),
      ),
      decoration: BoxDecoration(
        color: ColorApp.paw,
        borderRadius: BorderRadius.circular(10),
      ),
    );

  }
}
