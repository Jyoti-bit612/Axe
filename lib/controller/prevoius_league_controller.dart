import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/controller/home_controller.dart';
import 'package:axe/pojo/prevoius_league_detail_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class PreviousLeagueController extends GetxController  {
  Rx<TopPlayer> topPlayer=TopPlayer().obs ;
  Rx<PrevoiusLeagueDetailPojo> prevoiusLeaguePojo=PrevoiusLeagueDetailPojo().obs;
  final HomeController controller = Get.find();
  Rx<bool> isDataFound = false.obs;

  @override
  void onInit() {
    super.onInit();
    getprevoiusLeagueDetail();
    getTopPlayer();
  }

  Future<void> getprevoiusLeagueDetail() async {
    var jsonBody = {
      "league_id": controller.leagueId.value.toString(),
    };

    await Apiprovider.postApi(Constant.get_prevoiusLeagueDetail, jsonBody).then((value) {
      isDataFound.value=false;
      prevoiusLeaguePojo.value = PrevoiusLeagueDetailPojo.fromJson(json.decode(value));
        print(value);
    }, onError: (error) {
      isDataFound.value=true;
      Get.showSnackbar(
        GetSnackBar(
          duration: Duration(seconds: 1),
          title: "Axe Throwing",
          message: json.decode(error)["message"],
          isDismissible: true,
        ),
      );
    });
  }

  Future<void> getTopPlayer() async {
    var  jsonBody  =  {
      "league_id":controller.leagueId.value.toString(),
    };
   await Apiprovider.postApi(Constant.get_topPlayer,jsonBody).then((value) {
     topPlayer.value = TopPlayer.fromJson(json.decode(value));
     print(value);
   },onError: (error) {

   });
  }
}