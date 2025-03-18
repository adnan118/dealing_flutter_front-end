import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../MORE/Core/Constant/color.dart';

class customTextFormReqDocs extends StatelessWidget {
  final String? title;
  final String? hint;

  final TextEditingController myController;
  final String? Function(String?) valid;
  final TextInputType keyboardTypex;

  final void Function()? onTapicon;
  final IconData? icon;

  customTextFormReqDocs({
    Key? key,
    this.title,
    this.hint,
    required this.myController,
    required this.valid,
    required this.keyboardTypex,
    this.onTapicon,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
          controller: myController,
          onChanged: (value) {
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            label: Container(
              margin: EdgeInsets.only(top: 13),
              child: Text("$title",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 16)),
            ),
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
            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
            errorStyle: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 13, color: ColorApp.intergalactic),
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
