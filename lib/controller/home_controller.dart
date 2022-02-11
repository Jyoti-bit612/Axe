import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/pojo/upcoming_league_pojo.dart';
import 'package:axe/util/constants.dart';
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
    await Apiprovider.getApi(Constant.get_upcomingLeague).then((value) {
      upcomingLeaguePojo.value =
          UpcomingLeaguePojo.fromJson(json.decode(value));
    }, onError: (error) {
      upcomingLeaguePojo.value=UpcomingLeaguePojo();

      print(error);
    });
  }

  Future<void> getprevoiusLeague() async {
    await Apiprovider.getApi(Constant.get_prevoiusLeague).then((value) {
      prevoiusLeaguePojo.value =
          PrevoiusLeaguePojo.fromJson(json.decode(value));
    }, onError: (error) {
      prevoiusLeaguePojo.value=PrevoiusLeaguePojo();

      print(error);
    });
  }

  Future<void> getTopPlayer() async {
    var jsonBody = {
      "league_id": "",
    };
    await Apiprovider.postApi(Constant.get_topPlayer,jsonBody).then((value) {
      topPlayer.value = TopPlayer.fromJson(json.decode(value));
    }, onError: (error) {
      topPlayer.value=TopPlayer();

      print(error);
    });
  }

}