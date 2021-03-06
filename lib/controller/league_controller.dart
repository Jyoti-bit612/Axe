
import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class LeagueController extends GetxController {

  var pickedImage = "".obs;
  RxList seasonList=[].obs;
  RxList matchTypeList=[].obs;
  RxList matchList=[].obs;
  RxList leagueList=[].obs;
  var startDate="".obs;
  var endDate="".obs;
  var seasonName = "Select Season".obs;
  RxBool isOfficial=true.obs;
  RxBool unOfficial=false.obs;

  isOffical(bool isvalue) {
    isOfficial.value= isvalue;
    unOfficial.value=!isvalue;
  }

  unOffical(bool isvalue) {
    unOfficial.value=isvalue;
    isOfficial.value=!isvalue;
  }

  updateImage(var image) {
    pickedImage.value=image;
  }

  startDateValue(var startDate) {
    this.startDate=startDate;
  }

  endDateValue(var endDate) {
    this.endDate=endDate;
  }

 @override
  void onInit() {
    super.onInit();
    getSeason();
    getMatchType();
    getLeague();
    getMatch();
  }

  Future<void> getMatch() async {
    var response=await ApiProvider.getApi(Constant.get_match);
    matchList.value = jsonDecode(response)["data"];
    print(response);
  }

  Future<void> getSeason() async {
    var response=await ApiProvider.getApi(Constant.get_Season);
    seasonList.value = jsonDecode(response)["data"];
    print(response);
  }

  Future<void> getLeague() async {
    var response=await ApiProvider.getApi(Constant.get_league);
    leagueList.value = jsonDecode(response)["data"];
    print(response);
  }

  Future<void> getMatchType() async {
    var response=await ApiProvider.getApi(Constant.get_MatchType);
    matchTypeList.value=jsonDecode(response)["data"];
    print(response);
  }

}