import 'dart:convert';
import 'dart:ui';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'strings.dart';
import 'package:http/http.dart' as http;

class Global {

  static var loginType="1";  // 1 for user and 2 for venue

  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static addStringToSF(String value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  static getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    return stringValue;
  }

  static Future<String> getData(BuildContext context,String endUrl, String apiName, CallBackInterface callBackInterface) async {
   var token=await Global.getStringValuesSF(Constant.AccessToken);
    print(token);
    var response = await http.get(Uri.parse(Constant.baseUrl + endUrl),
        headers: {"Accept": "application/json",
          "Authorization": 'Bearer '+token,
        });
    print(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      callBackInterface.widgetCallBack(apiName, response.body,context);
    } else {
      callBackInterface.widgetCallBack("error", response.body, context);
    }
    return "Success!";
  }


  static Future<String> postData(BuildContext context, String endUrl, String apiName, Map jsonBody, CallBackInterface callBackInterface) async {
    print(jsonBody.toString());
    var token=await Global.getStringValuesSF(Constant.AccessToken);
    token ?? "";

    var url = Constant.baseUrl + endUrl;

    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer '+token,
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body: jsonEncode(jsonBody));
        print(response.body);

    if (response.statusCode == 201 ||response.statusCode == 200) {
      callBackInterface.widgetCallBack(apiName, response.body,context);
    } else if (response.statusCode == 422) {
      Get.back();
      if (json.decode(response.body)["errors"]["phone_number"] != null)
        toast(context, json.decode(response.body)["errors"]["phone_number"][0].toString());
      else if (json.decode(response.body)["errors"]["device_token"] != null)
        toast(context,
            json.decode(response.body)["errors"]["device_token"][0].toString());
      else if (json.decode(response.body)["errors"]["email"] != null)
        toast(context,json.decode(response.body)["errors"]["email"][0].toString());
      else if (json.decode(response.body)["errors"]["address"] != null)
        toast(context,json.decode(response.body)["errors"]["address"][0].toString());
      else if (json.decode(response.body)["errors"]["country"] != null)
        toast(context,json.decode(response.body)["errors"]["country"][0].toString());
      else if (json.decode(response.body)["errors"]["password"] != null)
        toast(context,json.decode(response.body)["errors"]["password"][0].toString());
      else
        toast(context,json.decode(response.body)["errors"].toString());
    }
    else {
      if(endUrl==Constant.get_Personal_Data ||endUrl.contains(Constant.get_progress) || endUrl==Constant.getMentalHealth ||endUrl.contains(Constant.getHealthDates)){

      }else if(endUrl==Constant.changePassword)
      {
        Get.back();
        toast(context, json.decode(response.body)["message"].toString());
      }
      else{
        Get.back();
        toast(context, json.decode(response.body)["error"].toString());
      }

    }
    return "Success!";
  }



  static toast(BuildContext context,String message){
    final snackBar = SnackBar(
        content: CommonWidget.getInstance().normalText(
            CommonColors.white, message,1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),
        backgroundColor: Theme.of(context).colorScheme.primary);
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static validation(String title, message, value) {
    switch (title) {
      case Strings.enter_email:
        print(EmailValidator.validate(value));
        if (value.isEmpty) {
          return message;
        } else if (!EmailValidator.validate(value)) {
          return "Please enter a valid email address";
        }

        break;

      case Strings.email + "*":
        print(EmailValidator.validate(value));
        if (value.isEmpty) {
          return message;
        } else if (!EmailValidator.validate(value)) {
          return "Please enter a valid email address";
        }
        break;

        break;
      case Strings.pass:
        if (value.isEmpty) {
          return message;
        } else if (value.length < 6 || value.length > 20) {
          return "Password contains 6-20 characters";
        }
        break;

      case  Strings.conirm_pass:
        if (value.isEmpty) {
          return message;
        } else if (value.length < 6 || value.length > 20) {
          return "Password contains 6-20 characters";
        }
        break;



    /*  case Strings.first_name + "*":
        if (value.isEmpty) {
          return message;
        }
        break;

      case Strings.last_name+"*":
        if (value.isEmpty) {
          return message;
        }
        break;*/
    }
  }
}
