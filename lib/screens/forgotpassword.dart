import 'dart:convert';

import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/screens/dashbaord.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPassword extends StatelessWidget  implements CallBackInterface{
ForgotPassword({Key? key}) : super(key: key);

final emailController = TextEditingController();
final passwordController = TextEditingController();
final emailFocus = FocusNode();
final passwordFocus = FocusNode();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            IconButton(onPressed: (){
              Get.back();
            }, icon: const Icon(Icons.arrow_back_rounded)),

            SizedBox(
              height: CommonWidget.getInstance().heightFactor(context) * 0.04,
            ),

            Center(
              child: Image.asset(
                "assets/images/forgot_password_logo.png",
                width: CommonWidget.getInstance().widthFactor(context) * 0.65,
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16),
              child: CommonWidget.getInstance().normalText(
                CommonColors.black, Strings.forgot_pass_wqm,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,2,FontWeight.w600),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 32.0,right:32),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: CommonWidget.getInstance().heightFactor(context) * 0.045,
                      ),

                      CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.plz_enter_your_mail,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                      SizedBox(
                        height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                      ),
                      CommonWidget.getInstance().editTextField(
                          "email",
                          context,
                          false,
                          CommonColors.textfiled_gray,
                          Strings.enter_email,
                          "",
                          emailController,
                          TextInputType.emailAddress,
                          emailFocus,
                          passwordFocus,
                          false,
                          false,
                          "email",
                          0),

                      SizedBox(
                        height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                      ),

                      CommonWidget.getInstance().flexibleButton(
                        context,
                        Strings.reset_password,
                        double.infinity,
                        CommonWidget.getInstance().widthFactor(context) * 0.13,
                        CommonColors.primaryColor1,
                        CommonColors.primaryColor1,
                        CommonColors.white,
                        this,
                      ),
                      SizedBox(height: CommonWidget.getInstance().heightFactor(context) * 0.04),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    switch(title){
      case Strings.reset_password:
        if(CommonWidget.getInstance().isValidate(formKey)){
          Global.showLoaderDialog(context);
          Map jsonBody = {
            "email": emailController.text
          };
          Global.postData(context, Constant.forgotPassword, Constant.forgotPassword, jsonBody, this);
        }
        break;
      case Constant.forgotPassword:
        Global.showSnackBar(context, jsonDecode(value)["message"]);
        Get.toNamed('/login');
    }
  }
}
