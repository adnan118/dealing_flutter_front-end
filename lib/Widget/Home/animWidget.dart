import 'package:flutter/material.dart';

class AnimWidget extends StatelessWidget {
 final Widget widget;
  const AnimWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1,
      duration: Duration(milliseconds: 1),
      curve: Curves.ease,
      child: widget,
    );
  }
}
