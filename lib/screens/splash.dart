import 'dart:async';
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
    loadPage();
  }

  String token="";

  Future<Timer> loadPage() async {
    return Timer(Duration(seconds: 1), onDoneLoading);
  }

  onDoneLoading() async {
    if (token == null || token == ""||token=="null") {
      Get.to(()=>const Login());
    } else {
      Get.to(()=>const Login());
    }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
        body: Center(child: Image.asset("assets/images/splash_logo.png")));
  }

}
