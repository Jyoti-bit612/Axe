import 'package:get/get.dart';

class CounterController extends GetxController {
  var isValue = true.obs;
  var isValueNew = true.obs;
  var isValueConfirm = true.obs;
  var pickedImage = "".obs;
  var userRole="Venue".obs;

  updateValue() {
    isValue.value=!isValue.value;
    update();
  }

  updateRole(var role) {
    userRole.value=role;
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

  updateImage(var image) {
    pickedImage.value=image;
    update();
  }

}