import 'package:get/get.dart';

class CounterController extends GetxController {
  var isValue = true.obs;
  var isValueNew = true.obs;
  var isValueConfirm = true.obs;
  var pickedImage = "".obs;


  updateValue() {
    isValue.value=!isValue.value;
  }

  // updateRole(var role) {
  //   userRole.value=role;
  // }

  updateValueNew() {
    isValueNew.value=!isValueNew.value;
  }

  updateValueConfirm() {
    isValueConfirm.value=!isValueConfirm.value;
  }

  updateImage(var image) {
    pickedImage.value=image;
  }


}