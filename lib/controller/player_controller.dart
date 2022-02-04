
import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/PlayerListPojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  Rx<PlayerListPojo> playerpojo=PlayerListPojo().obs ;
  Rx<PlayerListPojo> playerpojoDuplicate=PlayerListPojo().obs ;

 @override
  void onInit() {
    super.onInit();
    getPlayerList();
  }

  Future<void> getPlayerList() async {
    var response=await Apiprovider.getApi(Constant.get_Player);
    playerpojo.value= PlayerListPojo.fromJson(json.decode(response));
    playerpojoDuplicate.value= PlayerListPojo.fromJson(json.decode(response));
    print(response);
  }

}