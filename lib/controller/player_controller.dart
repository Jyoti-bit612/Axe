import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/playerlist_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  Rx<PlayerListPojo> playerpojo=PlayerListPojo().obs ;
  Rx<PlayerListPojo> playerpojoDuplicate=PlayerListPojo().obs ;
  Rx<String> player1d="".obs;
  Rx<String> player2id="".obs;
  RxList<dynamic> player1List=[].obs;
  RxList<dynamic> player2List=[].obs;

 @override
  void onInit() {
    super.onInit();
    if(Global.loginType==Constant.userVenue){
      getPlayerList();
    }
  }

  updatePlayer1Id(String id) {
    player1d.value=id;
  }

  updatePlayer2Id(String id) {
    player2id.value=id;
  }

  updatePlayer1IList(var playerList) {
    player1List.add(playerList);
  }

  updatePlayer2List(var playerList) {
    player2List.add(playerList);
  }

  Future<void> getPlayerList() async {
   String url = Global.loginType==Constant.userVenue?Constant.get_Player:Constant.getPlayerListPlayerSide;
   await ApiProvider.getApi(url).then((value) {
      playerpojo.value= PlayerListPojo.fromJson(json.decode(value));
      playerpojoDuplicate.value= PlayerListPojo.fromJson(json.decode(value));
    },onError: (error){
     playerpojo.value=PlayerListPojo();
     print(error);
    });
  }
}