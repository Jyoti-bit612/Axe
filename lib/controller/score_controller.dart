import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/ScorePojo.dart';
import 'package:axe/pojo/playerlist_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class ScoreDashController extends GetxController {
  Rx<ScorePojo> scorePojo=ScorePojo().obs ;
  var matchId="".obs;
  List<String> player1ListScore=[];
  List<String> player2ListScore=[];

 @override
  void onInit() {
    super.onInit();
    getScoreMatch();
  }


  Future<void> getScoreMatch() async {
    var jsonBody = {
      "match_id":matchId.value,
    };
   await Apiprovider.postApi(Constant.get_score_match,jsonBody).then((value) {
     player1ListScore=[];
     player2ListScore=[];
     scorePojo.value= ScorePojo.fromJson(json.decode(value));
    },onError: (error){
     print(error);
    });
  }
}