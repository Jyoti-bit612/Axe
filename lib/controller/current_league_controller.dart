import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/CurrentLeagueDetailPojo.dart';
import 'package:axe/pojo/CurrentLeaguePojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class CurrentLeagueController extends GetxController {
  Rx<CurrentLeaguePojo> currentLeaguePojo = CurrentLeaguePojo().obs;
  Rx<CurrentLeagueDetailPojo> currentLeagueDetailPojo = CurrentLeagueDetailPojo().obs;
  Rx<String> currentLeagueId = "".obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLeague();
  }

  currentLeagueID(String leagueId) {
   currentLeagueId.value = leagueId;
  }

  Future<void> getCurrentLeague() async {
    await Apiprovider.getApi(Constant.get_current_league).then((value) {
      currentLeaguePojo.value = CurrentLeaguePojo.fromJson(json.decode(value));
    }, onError: (error) {
      currentLeaguePojo.value=CurrentLeaguePojo();

      print(error);
    });
  }

  Future<void> getCurrentLeagueDetail() async {
    var jsonBody = {
      "league_id": currentLeagueId.value.toString(),
    };
    await Apiprovider.postApi(Constant.get_current_league_detail, jsonBody).then((value) {
      currentLeagueDetailPojo.value = CurrentLeagueDetailPojo.fromJson(json.decode(value));
      print(value);
    }, onError: (error) {
      currentLeagueDetailPojo.value=CurrentLeagueDetailPojo();

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