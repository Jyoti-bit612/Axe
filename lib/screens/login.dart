import 'dart:convert';

import 'package:axe/controller/pasword_counter.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/dashbaord.dart';
import 'package:axe/screens/forgotpassword.dart';
import 'package:axe/screens/signup.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget  implements CallBackInterface{
   Login({Key? key}) : super(key: key);

 final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final emailFocus = FocusNode();
 final passwordFocus = FocusNode();
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
        body:Obx(()=>Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Image.asset(
                  "assets/images/splash_logo.png",
                  width: CommonWidget.getInstance().widthFactor(context) * 0.50,
                ),
              ),

              CommonWidget.getInstance().normalText(
                CommonColors.black, Strings.log_in,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,2,FontWeight.w600),

              Padding(
                padding: const EdgeInsets.only(left: 18.0,right:18),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.035,
                        ),

                        CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.email,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),
                        CommonWidget.getInstance().editTextField(
                            "email",
                            context,
                            false,
                            CommonColors.textfiled_gray,
                            Strings.email,
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
                          height:
                          CommonWidget.getInstance().heightFactor(context) *
                              0.02,
                        ),

                        CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.pass,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            "password",
                            context,
                            true,
                            CommonColors.textfiled_gray,
                            Strings.pass,
                            "This  field is mandatory",
                            passwordController,
                            TextInputType.multiline,
                            passwordFocus,
                            null,
                            controller.isValue.value,
                            false,
                            "key",
                            0),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.015,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:2.0),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (){

                            },
                            child: Row(
                              children: [
                                Icon(Icons.check_box,size: CommonWidget.getInstance().widthFactor(context) * 0.06,color: CommonColors.primaryColor1,),
                                SizedBox(
                                  width: CommonWidget.getInstance().heightFactor(context) * 0.01,
                                ),
                                Expanded(
                                    child:CommonWidget.getInstance().normalText(
                                      CommonColors.darkGray, Strings.remember_me,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=> ForgotPassword());

                                  },
                                  child: CommonWidget.getInstance().normalText(
                                    CommonColors.black, Strings.forgot_pass,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:6.0),
                          child: CommonWidget.getInstance().flexibleButton(
                            context,
                            Strings.login,
                            double.infinity,
                            CommonWidget.getInstance().widthFactor(context) * 0.13,
                            CommonColors.primaryColor1,
                            CommonColors.primaryColor1,
                            CommonColors.white,
                            this,
                          ),
                        ),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                        ),

                        GestureDetector(
                          onTap: (){
                             Get.to(()=> SignUp());

                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: RichText(
                              text: TextSpan(
                                style:  TextStyle(
                                  fontSize: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(text: Strings.donot_account,
                                    style: TextStyle(color: CommonColors.black,
                                      fontFamily: 'nunito_regular.ttf',
                                      letterSpacing: 1

                                    ),
                                  ),
                                  TextSpan(
                                      text: Strings.sign_up,
                                      style: TextStyle(color: CommonColors.primaryColor1,
                                        fontFamily: 'nunito_regular.ttf',
                                          letterSpacing: 1
                                      )),
                                  TextSpan(
                                      text: Strings.here,
                                      style: TextStyle(color: CommonColors.black,
                                        fontFamily: 'nunito_regular.ttf',
                                          letterSpacing: 1

                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                             Expanded(child: Divider(height:10,thickness:1,color: CommonColors.grayColor,)),
                            SizedBox(
                              width: CommonWidget.getInstance().widthFactor(context) * 0.04,
                            ),

                            CommonWidget.getInstance().normalText(
                              CommonColors.grayColor, Strings.or_login_with,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                            SizedBox(
                              width: CommonWidget.getInstance().widthFactor(context) * 0.04,
                            ),

                            Expanded(child: Divider(height:10,thickness:1,color: CommonColors.grayColor,)),

                          ],
                        ),


                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/apple.png"),
                            Image.asset("assets/images/fb.png"),
                            Image.asset("assets/images/google.png"),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        )),
      ),
    );
  }

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    switch(title){
      case Strings.login:
        if(CommonWidget.getInstance().isValidate(formKey)){
          Global.showLoaderDialog(context);
          var  jsonBody  =  {
            "email":emailController.text.toString(),
            "password": passwordController.text.toString(),
            "device_token":Constant.deviceToken
          };
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          Global.postData(context,Constant.login,"LoginApi",jsonBody,this);
        }

        break;

      case "LoginApi":
        Get.back();
        Global.showSnackBar(context, jsonDecode(value)["message"]);
        Global.addStringToSF(jsonDecode(value)["access_token"],Constant.AccessToken);
        Global.loginType=jsonDecode(value)["user"]["user_type"]==1?"2":"1";
        await Global.addStringToSF(jsonDecode(value)["user"]["user_type"]==1?"2":"1",Constant.LoginType);  // 1 for vendor 2 for Player

        Get.to(()=>DashBoard(0));

        break;
    }
  }
}
