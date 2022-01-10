import 'package:get/get.dart';

class CounterController extends GetxController {
  var isValue = true.obs;
  var isValueNew = true.obs;
  var isValueConfirm = true.obs;

  updateValue() {
    isValue.value=!isValue.value;
    update();
  }

  updateValueNew() {
    isValueNew.value=!isValueNew.value;
    update();
  }

  updateValueConfirm() {
    isValueConfirm.value=!isValueConfirm.value;
    update();
  }

}