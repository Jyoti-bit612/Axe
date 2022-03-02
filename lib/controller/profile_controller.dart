import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/profilePojo.dart';
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
  var address="".obs;
  var picture="".obs;
  final emailFocus = FocusNode();
  final firstnameFocus = FocusNode();
  final lastnameFocus = FocusNode();
  final confirmPassFocus = FocusNode();
  final contactFocus = FocusNode();
  final passwordFocus = FocusNode();
  Rx<Profile> profilePojo = Profile().obs;
  Rx<bool> firstNameCheck=true.obs;
  Rx<bool> lastNameCheck=true.obs;
  Rx<bool> phoneCheck=true.obs;

  @override
  void onInit() {
    super.onInit();
    getprofile();
  }

  updateFirstNameCheck() {
    firstNameCheck.value=!firstNameCheck.value;
  }
  updateLastNameCheck() {
    lastNameCheck.value=!lastNameCheck.value;
  }
  updatePhoneNameCheck() {
    phoneCheck.value=!phoneCheck.value;
  }

  updateImage(var image) {
    pickedImage.value=image;
  }

  Future<void> getprofile() async {
    var jsonBody = {
      "user_type":Global.loginType,
    };
    await Apiprovider.postApi(Constant.get_venue_profile,jsonBody).then((value) {
      profilePojo.value = Profile.fromJson(json.decode(value));

      emailController.text=profilePojo.value.data!.email.toString();
      firstnameController.text=profilePojo.value.data!.firstName.toString();
      lastnameController.text=profilePojo.value.data!.lastName.toString();
      contactController.text=profilePojo.value.data!.phone??"";
      address.value=profilePojo.value.data!.address??"";
      picture.value=profilePojo.value.data!.picture.toString();

    }, onError: (error) {
      profilePojo.value=Profile();
      print(error);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}