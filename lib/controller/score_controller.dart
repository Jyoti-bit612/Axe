import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/ScorePojo.dart';
import 'package:axe/pojo/playerlist_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class ScoreDashController extends GetxController {
  Rx<ScorePojo> scorePojo=ScorePojo().obs ;
  var matchId="".obs;

 @override
  void onInit() {
    super.onInit();
    getScoreMatch();
  }


  Future<void> getScoreMatch() async {
    var jsonBody = {
      "match_id":matchId,
    };
   await Apiprovider.postApi(Constant.get_score_match,jsonBody).then((value) {
     scorePojo.value= ScorePojo.fromJson(json.decode(value));
    },onError: (error){
     print(error);
    });
  }
}