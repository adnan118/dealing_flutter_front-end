import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../MORE/Core/Constant/color.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtomAuth(
      {Key? key,
      required this.text,
      required this.onPressed, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: NeumorphicButton(
          margin: EdgeInsets.symmetric(vertical: 15),
          style: NeumorphicStyle(
            color: ColorApp.intergalactic,
            boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 8,
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
              fontSize: 20,
            )
                .copyWith(color: ColorApp.pureWhite),
          )),
    );
  }
}

