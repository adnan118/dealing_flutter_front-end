import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../MORE/Core/Constant/color.dart';

class customButtomRD extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const customButtomRD(
      {Key? key,
      required this.text,
      required this.onPressed, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      child: NeumorphicButton(
          margin: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
          style: NeumorphicStyle(
            color: ColorApp.intergalactic,
            boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            depth: 5,
            intensity: 0.8,
          ),
          onPressed: onPressed,
          child:  Text(
            textAlign: TextAlign.center,
            text,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(
              color: ColorApp.pureWhite,
              fontSize: 13,fontWeight: FontWeight.bold
            )
                .copyWith(color: ColorApp.pureWhite),
          ),



      ),
    );
  }
}

