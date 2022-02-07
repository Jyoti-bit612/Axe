import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/PlayerListPojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  Rx<PlayerListPojo> playerpojo=PlayerListPojo().obs ;
  Rx<PlayerListPojo> playerpojoDuplicate=PlayerListPojo().obs ;
  Rx<bool> isChecked=true.obs;
  Rx<String> player1d="".obs;
  Rx<String> player2id="".obs;

 @override
  void onInit() {
    super.onInit();
    getPlayerList();
  }

   updateBool() {
    isChecked.value=!isChecked.value;
   // update();
  }

  updatePlayer1Id(String id) {
    player1d.value=id;
  }

  updatePlayer2Id(String id) {
    player2id.value=id;
  }


  Future<void> getPlayerList() async {
    var response=await Apiprovider.getApi(Constant.get_Player);
    playerpojo.value= PlayerListPojo.fromJson(json.decode(response));
    playerpojoDuplicate.value= PlayerListPojo.fromJson(json.decode(response));
    print(response);
  }

}