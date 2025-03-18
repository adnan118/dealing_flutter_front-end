import 'package:Dealings/MORE/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class ArrowButton extends StatefulWidget {
  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      child:

      NeumorphicButton(
          margin: EdgeInsets.symmetric(vertical: 10),
          style: NeumorphicStyle(
            color: ColorApp.intergalactic,
            boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
            depth: 8,
            intensity: 0.8,
          ),
          onPressed: (){},
          child:     Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimatedArrow(1.0), // السهم الأول
              SizedBox(width: 5), // المسافة بين الأسهم
              _buildAnimatedArrow(0.6), // السهم الثاني
              SizedBox(width: 5), // المسافة بين الأسهم
              _buildAnimatedArrow(0.3), // السهم الثالث
            ],
          ),),



    );
  }

  Widget _buildAnimatedArrow(double opacity) {
    return FadeTransition(
      opacity: Tween<double>(begin: opacity, end: 0.0).animate(_animation),
      child: Icon(
        Icons.arrow_forward_ios,
        color: ColorApp.warmGray,
        size: 20,
      ),
    );
  }
}