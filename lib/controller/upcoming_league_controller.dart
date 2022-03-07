import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/controller/home_controller.dart';
import 'package:axe/pojo/prevoius_league_detail_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/pojo/upcoming_league_detail.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:get/get.dart';

class UpcomingLeagueController extends GetxController  {
  Rx<UpcomingLeagueDetail> upcomingLeaguePojo=UpcomingLeagueDetail().obs;
  final HomeController controller = Get.find();

  @override
  void onInit() {
    super.onInit();
   // getUpcomingLeagueDetail();
  }

  Future<void> getUpcomingLeagueDetail() async {
    var jsonBody = {
      "league_id": controller.leagueId.value.toString(),
    };
    String url = Global.loginType==Constant.userPlayer?Constant.playerUpcomingLeagueDetail:Constant.get_UpcomingLeagueDetail;
    await Apiprovider.postApi(url, jsonBody).then((value) {
      upcomingLeaguePojo.value = UpcomingLeagueDetail.fromJson(json.decode(value));
        print(value);
    }, onError: (error) {
      upcomingLeaguePojo.value=UpcomingLeagueDetail();
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 1),
          title: "Axe Throwing",
          message: json.decode(error)["message"] ?? json.decode(error)["error"],
          isDismissible: true,
        ),
      );
    });
  }
}