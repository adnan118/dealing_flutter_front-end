import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../MORE/Core/Constant/color.dart';

class customButtomHome extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color ?color;

  const customButtomHome(
      {Key? key,
      required this.text,
      required this.onPressed,  this.color, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      child: NeumorphicButton(
          margin: EdgeInsets.symmetric(vertical: 10),
          style: NeumorphicStyle(
            color:color?? ColorApp.intergalactic,
            boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
            depth: 8,
            intensity: 0.5,
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
              fontSize: 12,
            )
                .copyWith(color: ColorApp.pureWhite),
          )),
    );
  }
}

