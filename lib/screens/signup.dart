import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/login.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>  implements CallBackInterface{
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode confirmPassFocus = FocusNode();
  FocusNode contactFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  List list = [
    {"name": "user1"},
    {"name": "user2"},
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.signu_up,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,2,FontWeight.w600),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),

                Center(
                  child: Container(
                    width:  CommonWidget.getInstance().widthFactor(context) * 0.25,
                    height:  CommonWidget.getInstance().widthFactor(context) * 0.25,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: DecoratedBox(
                          decoration:  const BoxDecoration(
                            color: CommonColors.textfiled_gray,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/images/camera.png")),
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0,right:18),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.name,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "name",
                              context,
                              false,
                              CommonColors.textfiled_gray,
                              Strings.enter_name,
                              "",
                              nameController,
                              TextInputType.emailAddress,
                              nameFocus,
                              emailFocus,
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
                              CommonColors.black, Strings.userType,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          SizedBox(
                              height:
                              CommonWidget.getInstance().heightFactor(context) *
                                  0.09,
                              child: DropDownClass(
                                CommonColors.darkGray,
                                  "commonDropdown",
                                 list[0]["name"],
                                  list,
                                  this,
                                  "0",false, true)),


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
                              Strings.enter_email,
                              "This  field is mandatory",
                              emailController,
                              TextInputType.emailAddress,
                              emailFocus,
                              contactFocus,
                              false,
                              false,
                              "email",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.015,
                          ),

                          CommonWidget.getInstance().normalText(
                              CommonColors.black, Strings.contact,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "phone",
                              context,
                              false,
                              CommonColors.textfiled_gray,
                              Strings.enter_contact,
                              "This  field is mandatory",
                              contactController,
                              TextInputType.emailAddress,
                              contactFocus,
                              passwordFocus,
                              false,
                              false,
                              "phone",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.015,
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
                              TextInputType.emailAddress,
                              passwordFocus,
                              confirmPassFocus,
                              false,
                              false,
                              "email",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.015,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, Strings.conirm_pass,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "password",
                              context,
                              true,
                              CommonColors.textfiled_gray,
                              Strings.re_enter_pass,
                              "This  field is mandatory",
                              confirmpasswordController,
                              TextInputType.emailAddress,
                              confirmPassFocus,
                              null,
                              false,
                              false,
                              "email",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left:6.0),
                            child: CommonWidget.getInstance().flexibleButton(
                              context,
                              Strings.sign_up,
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
                              Get.to(()=>const Login());

                            },
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: RichText(
                                text: TextSpan(
                                  style: new TextStyle(
                                    fontSize: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: Strings.already_account,
                                      style: TextStyle(color: CommonColors.black,
                                        fontFamily: 'nunito_regular.ttf',
                                        letterSpacing: 1

                                      ),
                                    ),
                                    TextSpan(
                                        text: Strings.login,
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
                                CommonColors.grayColor, Strings.or_signup_with,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

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
          ),
        ),
      ),
    );
  }

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    switch(title){
      case Strings.sign_up:
        break;



    }
  }

}
