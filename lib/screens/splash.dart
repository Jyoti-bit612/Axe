import 'dart:async';
import 'package:axe/screens/dashbaord.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:axe/screens/login.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
    getToken();
    loadPage();
  }


  void firebaseCloudMessaging_Listeners() {
    FirebaseMessaging.instance.getToken().then((token){
      print(token);
      Global.addStringToSF(token!, Constant.Device_Token);
    });

  }

  String token="";

  Future<Timer> loadPage() async {
    return Timer(Duration(seconds: 1), onDoneLoading);
  }

  onDoneLoading() async {
    if (token == "") {
      Get.to(()=> Login());
    } else {
      Get.to(()=> DashBoard(0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
        body: Center(child: Image.asset("assets/images/splash_logo.png")));
  }

  Future<void> getToken() async {
    Constant.deviceToken=await Global.getStringValuesSF(Constant.Device_Token);
    token=await Global.getStringValuesSF(Constant.AccessToken);
    Constant.email=await Global.getStringValuesSF(Constant.email);

  }
}
