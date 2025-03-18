import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RequestDocs/customTextFormReqDocs.dart';

class buildTextField extends StatelessWidget {
 final String title;
 final   String Hint;
     final TextEditingController controller;
 final  TextInputType keyboardType;
     final String? Function(String?) valid;
  const buildTextField({Key? key, required this.title, required this.Hint, required this.controller, required this.keyboardType, required this.valid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   customTextFormReqDocs(
        title: title.tr,
        hint: Hint.tr,
        myController: controller,
        keyboardTypex: keyboardType,
        valid: valid!,
      );

  }
}
