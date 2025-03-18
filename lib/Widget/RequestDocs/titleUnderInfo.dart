import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../MORE/Core/Constant/color.dart';

class TitleUnderInfo extends StatelessWidget {
 final String label;
   final   IconData icon;
  const TitleUnderInfo({Key? key, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(margin: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),

          depth: 1),
      child:   ListTile(
        title:  Text(
          label,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold,fontSize: 13),
        ),
        leading: Icon(
          icon,
          color: ColorApp.intergalactic,
          size: 30,

        ),
      ),
    );
  }
}


