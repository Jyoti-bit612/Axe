import 'package:get/get.dart';

class LeagueController extends GetxController {

  var pickedImage = "".obs;

  updateValue() {
   // isValue.value=!isValue.value;
    update();
  }

 @override
  void onInit() {
    super.onInit();
    getLeagues();
  }

  void getLeagues() {


  }

}