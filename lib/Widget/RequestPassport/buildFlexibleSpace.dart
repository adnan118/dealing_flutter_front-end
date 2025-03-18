import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Function/validinput.dart';
import '../RequestDocs/customTextFormReqDocs.dart';
import '../RequestDocs/selecteBirthDate.dart';

class BuildFlexibleSpace extends StatefulWidget {

  final TextEditingController controllerOldpassportnumber;
  final TextEditingController controllerOldpassportDate;
  final TextEditingController controllerOldpassportExpiryDate;

  const BuildFlexibleSpace({Key? key, required this.controllerOldpassportnumber, required this.controllerOldpassportDate, required this.controllerOldpassportExpiryDate})
      : super(key: key);

  @override
  State<BuildFlexibleSpace> createState() => _BuildFlexibleSpaceState();
}

class _BuildFlexibleSpaceState extends State<BuildFlexibleSpace> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(horizontal: 10),
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            color: ColorApp.warmGray.withOpacity(0.2),
            depth: 1),
        child: Container(
            height: 400,
            child: AnimatedFractionallySizedBox(
              duration: Duration(seconds: 2),
              curve: Curves.ease,
              heightFactor: 1,
              child: Column(
                children: [
                  customTextFormReqDocs(
                    title: "Oldpassportnumber".tr,
                    hint: "Oldpassportnumber".tr,
                    myController: widget.controllerOldpassportnumber,
                    keyboardTypex: TextInputType.number,
                    valid: (val) =>
                        validinput(val!, 9, 9, "Oldpassportnumber"),

                  ),
             SizedBox(height: 5,),
             Flexible(child:      Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Oldpassportissuedate".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 12),
                        ),
                        SelectBirthDate(
                            birthday: widget.controllerOldpassportDate),
                      ])),
              SizedBox(height: 30,),
              Flexible(child:    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Oldpassportexpirydate".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 12),
                        ),
                        SelectBirthDate(
                            birthday:
                                widget.controllerOldpassportExpiryDate),
                      ])),
                ],
              ),
            )));
  }
}
