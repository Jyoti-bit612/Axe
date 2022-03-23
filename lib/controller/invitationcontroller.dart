import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/player_invitation_pojo.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/pojo/upcoming_league_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:get/get.dart';

class InvitationController extends GetxController {
  Rx<PlayerInvitationPojo> playerInvitationPojo = PlayerInvitationPojo().obs;
  Rx<PlayerInvitationPojo> playerRejectionPojo = PlayerInvitationPojo().obs;
  Rx<PlayerInvitationPojo> playerAcceptedPojo = PlayerInvitationPojo().obs;
  Rx<PlayerInvitationPojo> playerExpiredPojo = PlayerInvitationPojo().obs;

  @override
  void onInit() {
    super.onInit();
    getInvitationList();
    getAcceptedList();
    getRejectionList();
    getExpiredList();
  }


  Future<void> getInvitationList() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerNewInviteList:Constant.playerNewInviteList;
    await ApiProvider.getApi(url).then((value) {
      playerInvitationPojo.value = PlayerInvitationPojo.fromJson(json.decode(value));
    }, onError: (error) {
      playerInvitationPojo.value=PlayerInvitationPojo();
      print(error);
      print(url);
    });
  }

  Future<void> getRejectionList() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerRejectInviteList:Constant.playerRejectInviteList;
    await ApiProvider.getApi(url).then((value) {
      playerRejectionPojo.value = PlayerInvitationPojo.fromJson(json.decode(value));
    }, onError: (error) {
      playerRejectionPojo.value=PlayerInvitationPojo();
      print(error);
      print(url);
    });
  }

  Future<void> getAcceptedList() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerAcceptedInviteList:Constant.playerAcceptedInviteList;
    await ApiProvider.getApi(url).then((value) {
      playerAcceptedPojo.value = PlayerInvitationPojo.fromJson(json.decode(value));
    }, onError: (error) {
      playerAcceptedPojo.value=PlayerInvitationPojo();
      print(error);
      print(url);
    });
  }

  Future<void> getExpiredList() async {
    String url = Global.loginType==Constant.userPlayer?Constant.playerExpiredInviteList:Constant.playerExpiredInviteList;
    await ApiProvider.getApi(url).then((value) {
      playerExpiredPojo.value = PlayerInvitationPojo.fromJson(json.decode(value));
    }, onError: (error) {
      playerExpiredPojo.value=PlayerInvitationPojo();
      print(error);
      print(url);
    });
  }

}