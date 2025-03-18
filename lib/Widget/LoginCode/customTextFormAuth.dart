import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../MORE/Core/Constant/color.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String? title;
  final String? hint;
  final IconData icon;
  final bool? obscureText;
  final void Function()? onTapicon;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final TextInputType keyboardTypex;

  const CustomTextFormAuth({
    Key? key,
    this.title,
    this.hint,
    required this.icon,
    required this.myController,
    this.valid,
    required this.keyboardTypex,
    this.obscureText,
    this.onTapicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            color: ColorApp.pureWhite,
            depth: -5),
        child: TextFormField(
          cursorColor: ColorApp.intergalactic,
          keyboardAppearance: Brightness.light,
          validator: valid,
          keyboardType: keyboardTypex,
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          // isPassword,
          controller: myController,
          onChanged: (value) {},
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            label: Text("$title",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 16)),
            hintText: "$hint",
            hintStyle: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 13, color: ColorApp.mildBlue),
            suffixIcon: InkWell(
              onTap: onTapicon,
              child: Icon(
                icon,
                color: ColorApp.caddiesSilk,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorApp.mildBlue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),

            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
              errorStyle:  Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 13,color: ColorApp.intergalactic),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
