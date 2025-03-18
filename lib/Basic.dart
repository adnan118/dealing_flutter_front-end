import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Basic extends StatelessWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Basic")),
      body: ListView(
        children: [
          MaterialButton(
            onPressed: () {
              Get.toNamed("/AnimatedFoo1");
              },
            color: Colors.yellow,
            child: const Text("AnimatedFoo 1"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/TweenAnimation");
              },
            color: Colors.pink,
            child: const Text("TweenAnimation"),

          ),
          const Divider(thickness: 2,),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/FooTransition");
              },
            color: Colors.green,
            child: const Text("Foo Transition"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/FooTransition2");
              },
            color: Colors.lightGreenAccent,
            child: const Text("Foo FooTransition2"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/FooTransition3");
              },
            color: Colors.orange,
            child: const Text("Foo FooTransition3"),

          ),

          MaterialButton(
            onPressed: () {
              Get.toNamed("/animationBuilder");
              },
            color: Colors.yellowAccent,
            child: const Text("ِAnimation Builder"),

          ),
          const Divider(thickness: 5,color: Colors.black),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Rotation");
              },
            color: Colors.grey,
            child: const Text("ِAnimated Rotation"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Rotation_Transition");
              },
            color: Colors.grey,
            child: const Text("Rotation Transition"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Opacity");
              },
            color: Colors.lightBlueAccent,
            child: const Text("Animated Opacity"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_OpacityFade");
              },
            color: Colors.lightBlueAccent,
            child: const Text("Animated OpacityFade"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Default_TextStyle");
              },
            color: Colors.pinkAccent,
            child: const Text("Animated Default_ extStyle"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Default_TextStyle_Transition");
              },
            color: Colors.pinkAccent,
            child: const Text("Default TextStyle Transition"),

          ),

          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Slide");
              },
            color: Colors.yellow,
            child: const Text("Animated Slide"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Slide_Transition");
              },
            color: Colors.yellow,
            child: const Text("Slide Transition"),

          ),

          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Positioned");
              },
            color: Colors.red,
            child: const Text("Animated Positioned"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Positioned_Transition");
              },
            color: Colors.red,
            child: const Text("Positioned Transition"),

          ),

          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Positioned_Directional");
              },
            color: Colors.red,
            child: const Text("Animated Positioned Directional"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Positioned_Directional_Transition");
              },
            color: Colors.red,
            child: const Text("Positioned Directional Transition"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Padding");
              },
            color: Colors.greenAccent,
            child: const Text("Animated Padding"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Padding_Transition");
              },
            color: Colors.greenAccent,
            child: const Text("Padding Transition"),

          ),

          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Physical_Model");
              },
            color: Colors.purple,
            child: const Text(" Animated Physical Model"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Fractionally_SizedBox");
              },
            color: Colors.green,
            child: const Text(" Animated Fractionally SizedBox"),

          ),

          MaterialButton(
            onPressed: () {
              Get.toNamed("/Align_Transition");
              },
            color: Colors.orangeAccent,
            child: const Text("Align Transition"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Align");
              },
            color: Colors.orangeAccent,
            child: const Text("Animated Align"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Animated_Scale");
              },
            color: Colors.brown,
            child: const Text("Animated Scale"),

          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/Scale_Transition");
              },
            color: Colors.brown,
            child: const Text("Scale Transition"),

          ),
      ],
      )
    );
  }
}

/*
تعلم اساسيات  "flutter animation"
بتطبيقات عملية علي كافة الطرق المختلفة مثل
------------------------------------------------------------------------------------

   "implicit animation"  ==> animated Foo       (build in imp)
                                           tween ani builder ( custom imp)
   "explicit animation"  ==>  Foo Translation   (build in exp)
                                            Animated builder (custom exp)

------------------------------------------------------------------------------------

  و ال "hero animation"
 و ال "third party animation"
➖➖➖➖


*/