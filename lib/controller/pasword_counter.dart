import 'package:get/get.dart';

class CounterController extends GetxController {
  bool isValue = true;

  updateValue() {
    isValue=!isValue;
    update();
  }

}