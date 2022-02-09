import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/playerlist_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  Rx<PlayerListPojo> playerpojo=PlayerListPojo().obs ;
  Rx<String> player1d="".obs;
  Rx<String> player2id="".obs;
  dynamic argumentData = Get.arguments;

 @override
  void onInit() {
    super.onInit();
    var ff=argumentData??"";
    getPlayerList();
  }



  updatePlayer1Id(String id) {
    player1d.value=id;
  }

  updatePlayer2Id(String id) {
    player2id.value=id;
  }


  Future<void> getPlayerList() async {
   /* var response=await Apiprovider.getApi(Constant.get_Player);
    playerpojo.value= PlayerListPojo.fromJson(json.decode(response));
   // playerpojoDuplicate.value= PlayerListPojo.fromJson(json.decode(response));
    print(response);*/

    await Apiprovider.getApi(Constant.get_Player).then((value) {
      playerpojo.value= PlayerListPojo.fromJson(json.decode(value));
    },onError: (error){
     print(error);
    });

  }

}