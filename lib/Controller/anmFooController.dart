import 'package:get/get.dart';

class FooController extends GetxController {
  var dimension = 100.0.obs;


  void toggleDimension() {
    dimension.value = (dimension.value == 100) ? 200 : 100;
  }



  void toggleTween_b_e(b ,e) {
    b=b==0?100:0;
    e=e==100?0:100;
  }
}