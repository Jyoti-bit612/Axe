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
import 'package:http/http.dart' as http;

class Global {

  static var loginType="1";  // from backend--> 1 for venue and 2 for user

  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static addStringToSF(String value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  static getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    return stringValue??"";
  }

  static Widget setEmptyText(String text,BuildContext context){
    return CommonWidget.getInstance().normalText(
        CommonColors.red,text,0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,1,FontWeight.w600,fontfamily: false);
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

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 5), child: const Text("Please Wait...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  static Future<String> postData(BuildContext context, String endUrl, String apiName, Map jsonBody, CallBackInterface callBackInterface) async {
    print(jsonBody.toString());
    var token=await Global.getStringValuesSF(Constant.AccessToken);

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
    } else if (response.statusCode == 404) {
      Get.back();
      if (json.decode(response.body)["message"] != null) {
        showSnackBar(context,json.decode(response.body)["message"].toString());
      } else {
        showSnackBar(context,json.decode(response.body)["errors"].toString());
      }
    }
    else {
      if(endUrl==Constant.login ||endUrl.contains(Constant.login) || endUrl==Constant.login ||endUrl.contains(Constant.login)){

      }else if(endUrl==Constant.login)
      {
        Get.back();
        showSnackBar(context, json.decode(response.body)["message"].toString());
      }
      else{
        Get.back();
        showSnackBar(context, json.decode(response.body)["error"].toString());
      }

    }
    return "Success!";
  }



  static showPicker(BuildContext context,CallBackInterface callBackInterface) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                 ListTile(
                    leading:  Icon(Icons.photo_library,size: CommonWidget.getInstance().widthFactor(context)*0.046,),
                    title:  Text('Gallery',style: TextStyle(fontFamily: "Lato",fontSize: CommonWidget.getInstance().widthFactor(context)*0.046),),
                    onTap: () {
                      callBackInterface.widgetCallBack('Gallery',"",context);
                      Get.back();

                    }),
                 ListTile(
                  leading:  Icon(Icons.photo_camera,size: CommonWidget.getInstance().widthFactor(context)*0.046,),
                  title:  Text('Camera',style: TextStyle(fontFamily: "Lato",fontSize: CommonWidget.getInstance().widthFactor(context)*0.046),),
                  onTap: () {
                    callBackInterface.widgetCallBack('Camera',"",context);
                   Get.back();
                  },
                ),
              ],
            ),
          );
        }
    );
  }

  static showSnackBar(BuildContext context,String message){
    final snackBar = SnackBar(
        content: CommonWidget.getInstance().normalText(
            CommonColors.white, message,1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w200),
        backgroundColor: CommonColors.primaryColor1);
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static validation(String title, message, value) {
    switch (title) {
      case "phone":
        if (value.isEmpty) {
          return message;
        } else if (value.length < 6 || value.length > 16) {
          return "Please enter valid phone nUmber";
        }

        break;

      case "email":
        print(EmailValidator.validate(value));
        if (value.isEmpty) {
          return message;
        } else if (!EmailValidator.validate(value)) {
          return "Please enter a valid email address";
        }
        break;

      case  "password":
        if (value.isEmpty) {
          return message;
        } else if (value.length < 6 || value.length > 20) {
          return "Password contains 6-20 characters";
        }
        break;


        case  "name":
        if (value.isEmpty) {
          return message;
        }
        break;

      case  "empty":

        break;
    }
  }

  static logOut() async {
    var token=await Global.getStringValuesSF(Constant.AccessToken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Constant.baseUrl + Constant.logout;

    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer '+token,
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 201 ||response.statusCode == 200) {
      prefs.clear();
      Get.offAndToNamed('/login');
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 4),
          title: "Axe Throwing",
          message: json.decode(response.body)["message"].toString(),
          isDismissible: true,
        ),
      );
    } else {
      if (json.decode(response.body)["message"] != null) {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 1),
            title: "Axe Throwing",
            message: json.decode(response.body)["message"].toString(),
            isDismissible: true,
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 2),
            title: "Axe Throwing",
            message: json.decode(response.body)["errors"].toString(),
            isDismissible: true,
          ),
        );
      }
    }
  }
}
