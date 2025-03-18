import 'package:flutter/material.dart';

class ResponsePadding extends StatelessWidget {
  final Widget widget;
  const ResponsePadding({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height *0.01,
          horizontal: MediaQuery.of(context).size.width *0.001,
          //من عرض الشاشة ),
        ),
        child: widget
    );
  }
}


