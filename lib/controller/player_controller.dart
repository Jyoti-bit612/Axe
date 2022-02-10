import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/playerlist_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  Rx<PlayerListPojo> playerpojo=PlayerListPojo().obs ;
  Rx<String> player1d="".obs;
  Rx<String> player2id="".obs;
  RxList<dynamic> player1List=[].obs;
  RxList<dynamic> player2List=[].obs;

 @override
  void onInit() {
    super.onInit();
    getPlayerList();
  }

  updatePlayer1Id(String id) {
    player1d.value=id;
  }

  updatePlayer2Id(String id) {
    player2id.value=id;
  }

  updatePlayer1IList(var playerList) {
    player1List.add(playerList);
    refresh();
  }

  updatePlayer2List(var playerList) {
    player2List.add(playerList);
    refresh();

  }

  Future<void> getPlayerList() async {
   await Apiprovider.getApi(Constant.get_Player).then((value) {
      playerpojo.value= PlayerListPojo.fromJson(json.decode(value));
    },onError: (error){
     print(error);
    });
  }
}