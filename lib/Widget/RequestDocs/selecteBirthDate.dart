import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../MORE/Core/Constant/color.dart';

class SelectBirthDate extends StatefulWidget {
  final TextEditingController birthday;

  SelectBirthDate({Key? key, required this.birthday}) : super(key: key);

  @override
  State<SelectBirthDate> createState() => _SelectBirthDateState();
}

class _SelectBirthDateState extends State<SelectBirthDate> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(13)),
          color: ColorApp.pureWhite,
          depth: -5),
      child: TextButton.icon(
        onPressed: () async {
          selectedDate  = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: ColorApp.paw,
                  // لون الزر الرئيسي
                  colorScheme: ColorScheme.light(primary: ColorApp.mildBlue),
                  // لون الـ accent
                  buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme.primary), // ثيم الأزرار
                ),
                child: child!,
              );
            },
          );

          if (selectedDate != null) {
            setState(() {
              widget.birthday.text = "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"; // تعيين النص إلى الـ controller
            });
          }
        },
        label: Row(
          children: [
            Icon(
              Icons.calendar_month_outlined,
              color: ColorApp.caddiesSilk,
            ),
            Text(
              widget.birthday.text.isEmpty
                  ? "      Y-M-D     "
                  : "      ${widget.birthday.text!}     ",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: ColorApp.intergalactic),
              textAlign: TextAlign.center,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        icon: Text(""),
      ),
    );
  }
}
