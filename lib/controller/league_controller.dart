
import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class LeagueController extends GetxController {

  var pickedImage = "".obs;
 // var seasonPojo=SeasonPojo().obs;
  List seasonList=[].obs;

  updateValue() {
   // isValue.value=!isValue.value;
    update();
  }

 @override
  void onInit() {
    super.onInit();
    getSeason();
  }

  Future<void> getSeason() async {
    var response=await Apiprovider().getApi(Constant.get_Season);
    seasonList.add(jsonDecode(response)["data"]);
   // seasonPojo.value= SeasonPojo.fromJson(jsonDecode(response));

    print(response);

  }

}