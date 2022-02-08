
import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/prevoius_league_detail_pojo.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/pojo/upcoming_league_pojo.dart';
import 'package:axe/pojo/prevoius_league_detail_pojo.dart';
import 'package:axe/screens/prevoius_league_detail.dart';
import 'package:axe/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviousLeagueController extends GetxController  {
  Rx<TopPlayer> topPlayer=TopPlayer().obs ;
  Rx<PrevoiusLeagueDetailPojo> prevoiusLeaguePojo=PrevoiusLeagueDetailPojo().obs ;

 @override
  void onInit() {
    super.onInit();
    getprevoiusLeague();
  //  getTopPlayer();
  }

  Future<void> getprevoiusLeague() async {
    var response=await Apiprovider.getApi(Constant.get_prevoiusLeagueDetail);
    prevoiusLeaguePojo.value= PrevoiusLeagueDetailPojo.fromJson(json.decode(response));
    print(response);

  }

  Future<void> getTopPlayer() async {
    var response=await Apiprovider.getApi(Constant.get_topPlayer);
    topPlayer.value= TopPlayer.fromJson(json.decode(response));
    print(response);
  }

}