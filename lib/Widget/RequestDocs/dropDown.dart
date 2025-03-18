import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../MORE/Core/Constant/color.dart';

class DropDownReq extends StatelessWidget {
  final String label;
  final RxString selectedValue;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?) onChanged;
  final String validation;

  const DropDownReq(
      {Key? key,
      required this.label,
      required this.selectedValue,
      required this.items,
      required this.onChanged,
      required this.validation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        margin: EdgeInsets.symmetric(vertical: 5),
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            color: ColorApp.pureWhite,
            depth: -5),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "$label",
            label: Container(
                margin: EdgeInsets.only(top: 15),
                child: Text("$label",
                    style: TextStyle(
                      overflow: TextOverflow.fade,
                      color: ColorApp.caddiesSilk,
                      fontSize: 16,
                    ))),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
            errorStyle: TextStyle(
              overflow: TextOverflow.fade,
              color: ColorApp.intergalactic,
              fontSize: 13,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          value: selectedValue.value.isEmpty ? null : selectedValue.value,
          items: items,
          onChanged: onChanged,
          validator: (value) => (value == null) ? validation : null,
          dropdownColor: ColorApp.paw, // اللون الخلفي للقائمة المنسدلة
        ));
  }
}
