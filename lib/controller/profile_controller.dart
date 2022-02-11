import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/pojo/upcoming_league_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var pickedImage = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  updateImage(var image) {
    pickedImage.value=image;
  }
}