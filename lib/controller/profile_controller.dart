import 'dart:convert';
import 'package:axe/api/apiprovider.dart';
import 'package:axe/pojo/playerprofilepojo.dart';
import 'package:axe/pojo/prevoius_league_pojo.dart';
import 'package:axe/pojo/profilepojo.dart';
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
  final aboutController = TextEditingController();
  var address="".obs;
  var picture="".obs;
  final emailFocus = FocusNode();
  final firstnameFocus = FocusNode();
  final lastnameFocus = FocusNode();
  final confirmPassFocus = FocusNode();
  final contactFocus = FocusNode();
  final passwordFocus = FocusNode();
  final aboutFocus = FocusNode();
  Rx<ProfilePojo> profilePojo = ProfilePojo().obs;
  Rx<PlayerProfilePojo> playerProfilePojo = PlayerProfilePojo().obs;
  Rx<bool> firstNameCheck=true.obs;
  Rx<bool> lastNameCheck=true.obs;
  Rx<bool> phoneCheck=true.obs;
  Rx<bool> myStatusCheck=true.obs;

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
  updateMyStatusCheck() {
    myStatusCheck.value=!myStatusCheck.value;
  }

  updateImage(var image) {
    pickedImage.value=image;
  }

  Future<void> getprofile() async {
    String url = Global.loginType==Constant.userPlayer?Constant.getPlayerProfile:Constant.get_venue_profile;
    var jsonBody = {
      "user_type":Global.loginType,
    };
    await Apiprovider.postApi(url,jsonBody).then((value) {
      if(url==Constant.get_venue_profile){
        profilePojo.value = ProfilePojo.fromJson(json.decode(value));
        emailController.text=profilePojo.value.data!.email.toString();
        firstnameController.text=profilePojo.value.data!.firstName.toString();
        lastnameController.text=profilePojo.value.data!.lastName.toString();
        contactController.text=profilePojo.value.data!.phone??"";
        address.value=profilePojo.value.data!.address??"";
        picture.value=profilePojo.value.data!.picture.toString();
      }else{
        playerProfilePojo.value = PlayerProfilePojo.fromJson(json.decode(value));
        emailController.text = playerProfilePojo.value.data!.email.toString();
        firstnameController.text = playerProfilePojo.value.data!.firstName.toString();
        lastnameController.text = playerProfilePojo.value.data!.lastName.toString();
        contactController.text = playerProfilePojo.value.data!.phone??"";
        address.value = playerProfilePojo.value.data!.address??"";
        picture.value = playerProfilePojo.value.data!.picture.toString();
        aboutController.text = playerProfilePojo.value.data!.about??"";
      }


    }, onError: (error) {
      url==Constant.get_venue_profile?profilePojo.value = ProfilePojo()
          :playerProfilePojo.value = PlayerProfilePojo();
      print(error);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}