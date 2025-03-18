import 'dart:io';

import 'package:Dealings/MORE/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class BtnAttach extends StatelessWidget {
  final Color colorbg;
  final Color colorlable;
  final String textbefor;
  final String textafter;
  final double padding;
  final IconData iconsbefore;
  final IconData iconsafter;
  final EdgeInsets margin;
  final condition;

  final void Function()? onPressed;

  const BtnAttach(
      {Key? key,
      required this.colorbg,
      required this.colorlable,
      this.onPressed,
      required this.textbefor,
      required this.textafter,
      this.condition,
      required this.padding, required this.margin,
        required this.iconsbefore, required this.iconsafter })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: padding,horizontal: padding),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: colorbg,
        textColor: colorlable,
        child: Column(
          children: [
            Text(condition ? textbefor : textafter,textAlign: TextAlign.center,),

          Icon(condition ?iconsbefore:iconsafter,color: ColorApp.caddiesSilk,)

          ],
        ),
      ),
     margin: margin,
    );
  }
}
