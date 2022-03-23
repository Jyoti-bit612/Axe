import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/controller/home_controller.dart';
import 'package:axe/pojo/prevoius_league_detail_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:get/get.dart';

class PreviousLeagueController extends GetxController  {
  Rx<TopPlayer> topPlayer=TopPlayer().obs ;
  Rx<PrevoiusLeagueDetailPojo> prevoiusLeaguePojo=PrevoiusLeagueDetailPojo().obs;
  final HomeController controller = Get.find();
  Rx<bool> isDataFound = false.obs;

  @override
  void onInit() {
    super.onInit();
   // getprevoiusLeagueDetail();
    getTopPlayer();
  }

  Future<void> getprevoiusLeagueDetail() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerPrevoiusLeagueDetail:Constant.get_prevoiusLeagueDetail;
    var jsonBody = {
      "league_id": controller.leagueId.value.toString(),
    };
    await ApiProvider.postApi(url, jsonBody).then((value) {
      isDataFound.value=false;
      prevoiusLeaguePojo.value = PrevoiusLeagueDetailPojo.fromJson(json.decode(value));
        print(value);
    }, onError: (error) {
      prevoiusLeaguePojo.value=PrevoiusLeagueDetailPojo();
      isDataFound.value=true;
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 1),
          title: "Axe Throwing",
          message: json.decode(error)["message"]??json.decode(error)["error"],
          isDismissible: true,
        ),
      );
    });
  }

  Future<void> getTopPlayer() async {
    var  jsonBody  =  {
      "league_id":controller.leagueId.value.toString(),
    };
   await ApiProvider.postApi(Constant.get_topPlayer,jsonBody).then((value) {
     topPlayer.value = TopPlayer.fromJson(json.decode(value));
     print(value);
   },onError: (error) {
     topPlayer.value=TopPlayer();
   });
  }
}