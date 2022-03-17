import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/currentleaguedetailpojo.dart';
import 'package:axe/pojo/currentleaguepojo.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:get/get.dart';

class CurrentLeagueController extends GetxController {
  Rx<CurrentLeaguePojo> currentLeaguePojo = CurrentLeaguePojo().obs;
  Rx<CurrentLeagueDetailPojo> currentLeagueDetailPojo = CurrentLeagueDetailPojo().obs;
  Rx<String> currentLeagueId = "".obs;

  @override
  void onInit() {
    super.onInit();
    if(Global.loginType==Constant.userVenue){
      getCurrentLeague();
    }
  }

  currentLeagueID(String leagueId) {
   currentLeagueId.value = leagueId;
  }

  Future<void> getCurrentLeague() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerCurrentLeague:Constant.get_current_league;
    await Apiprovider.getApi(url).then((value) {
      currentLeaguePojo.value = CurrentLeaguePojo.fromJson(json.decode(value));
    }, onError: (error) {
      currentLeaguePojo.value=CurrentLeaguePojo();
      print(error);
    });
  }

  Future<void> getCurrentLeagueDetail() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerCurrentLeagueDetail:Constant.get_current_league_detail;
    var jsonBody = {
      "league_id": currentLeagueId.value.toString(),
    };
    await Apiprovider.postApi(url, jsonBody).then((value) {
      currentLeagueDetailPojo.value = CurrentLeagueDetailPojo.fromJson(json.decode(value));
      print(value);
      print(url);
    }, onError: (error) {
      currentLeagueDetailPojo.value=CurrentLeagueDetailPojo();
      print(url);
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
}