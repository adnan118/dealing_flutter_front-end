import 'package:flutter/material.dart';
import '../../MORE/Core/Constant/color.dart';
import 'customButtomHome.dart';

class ContainerHome extends StatefulWidget {
  final Color colorBg;
  final Color colorContent;
  final String title;
  final String content;
  final String titleBtn;
  final void Function()? onPressed;
  final Color ?colorbtn;

  const ContainerHome({
    Key? key,
    required this.colorBg,
    required this.title,
    required this.content,
    required this.titleBtn,
    required this.colorContent,
    required this.onPressed, this.colorbtn,
  }) : super(key: key);

  @override
  _ContainerHomeState createState() => _ContainerHomeState();
}

class _ContainerHomeState extends State<ContainerHome> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // ابدأ من الجانب الأيمن
      end: Offset.zero, // الوصول إلى الموضع الأصلي
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCirc,
    ));

    // بدء الانيميشن عند تحميل الويدجت
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: widget.colorBg,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 8),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: widget.colorContent,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 5),
                    Text(
                      widget.content,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: widget.colorContent,
                        overflow: TextOverflow.ellipsis,
                        fontSize: MediaQuery.of(context).size.width * 0.025,
                      ),
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: customButtomHome(
                  onPressed: widget.onPressed,
                  text: widget.titleBtn,
                  color: widget.colorbtn?? ColorApp.intergalactic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}