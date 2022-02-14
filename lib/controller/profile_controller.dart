import 'dart:convert';
import 'package:axe/api/Apiprovider.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/top_player_pojo.dart';
import 'package:axe/pojo/upcoming_league_pojo.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var pickedImage = "".obs;
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passwordController = TextEditingController();
  final contactController = TextEditingController();
  final emailFocus = FocusNode();
  final firstnameFocus = FocusNode();
  final lastnameFocus = FocusNode();
  final confirmPassFocus = FocusNode();
  final contactFocus = FocusNode();
  final passwordFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<bool> autofocus=false.obs;

  @override
  void onInit() {
    super.onInit();
    getprofile();
  }

  updateFocus() {
    autofocus.value=!autofocus.value;
  }

  updateImage(var image) {
    pickedImage.value=image;
  }

  Future<void> getprofile() async {
    emailController.text=await Global.getStringValuesSF(Constant.email);

  }
}