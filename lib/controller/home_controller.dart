import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/pojo/upcoming_league_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pickedImage = "".obs;
  Rx<UpcomingLeaguePojo> upcomingLeaguePojo = UpcomingLeaguePojo().obs;
  Rx<PrevoiusLeaguePojo> prevoiusLeaguePojo = PrevoiusLeaguePojo().obs;
  Rx<TopPlayer> topPlayer = TopPlayer().obs;
  Rx<String> leagueId = "".obs;


  @override
  void onInit() {
    super.onInit();
    getUpcomingLeague();
    getprevoiusLeague();
    getTopPlayer();
  }

  updateLeagueID(String leagueId) {
    this.leagueId.value = leagueId;
  }

  Future<void> getUpcomingLeague() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerUpcomingLeague:Constant.get_upcomingLeague;
    await ApiProvider.getApi(url).then((value) {
      upcomingLeaguePojo.value = UpcomingLeaguePojo.fromJson(json.decode(value));
    }, onError: (error) {
      upcomingLeaguePojo.value=UpcomingLeaguePojo();
      print(error);
      print(url);
    });
  }

  Future<void> getprevoiusLeague() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerPrevoiusLeague:Constant.get_prevoiusLeague;
    await ApiProvider.getApi(url).then((value) {
      prevoiusLeaguePojo.value =
          PrevoiusLeaguePojo.fromJson(json.decode(value));
    }, onError: (error) {
      prevoiusLeaguePojo.value=PrevoiusLeaguePojo();
      print(error);
      print(url);
    });
  }

  Future<void> getTopPlayer() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerSideTopPlayer:Constant.get_topPlayer;
    var jsonBody = {
      "league_id": "",
    };
    await ApiProvider.postApi(url,jsonBody).then((value) {
      topPlayer.value = TopPlayer.fromJson(json.decode(value));
    }, onError: (error) {
      topPlayer.value=TopPlayer();
      print(error);
      print(url);
    });
  }
}