import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../MORE/Core/Constant/color.dart';

class CustomTextFormLegalConsultation extends StatefulWidget {
  final String? title;
  final String? hint;
  final int? maxLines;
  final TextEditingController myController;
  final String? Function(String?)? valid;

  const CustomTextFormLegalConsultation(
      {Key? key,
      required this.myController,
      this.title,
      this.hint,
      this.valid,
      required this.maxLines})
      : super(key: key);

  @override
  State<CustomTextFormLegalConsultation> createState() =>
      _CustomTextFormLegalConsultationState();
}

class _CustomTextFormLegalConsultationState
    extends State<CustomTextFormLegalConsultation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Neumorphic(
            style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                color: ColorApp.pureWhite,
                depth: -5),
            child: TextFormField(
              controller: widget.myController,
              cursorColor: ColorApp.intergalactic,
              maxLines: widget.maxLines,
              validator: widget.valid,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                label: Text(widget.title.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 16)),
                hintText: widget.hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 13, color: ColorApp.mildBlue),
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
            )));
  }
}
