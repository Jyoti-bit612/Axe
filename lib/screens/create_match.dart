import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CreateMatch extends StatelessWidget implements CallBackInterface{
  CreateMatch({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final contactController = TextEditingController();
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final confirmPassFocus = FocusNode();
  final contactFocus = FocusNode();
  final passwordFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final list = [
    {"name": "user1"},
    {"name": "user2"},
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: (){
                Get.back();
              }, icon: const Icon(Icons.arrow_back_rounded)),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.02,
              ),

              Center(child: Image.asset("assets/images/create_match.png")),

              Center(
                child: CommonWidget.getInstance().normalText(
                    CommonColors.black,Strings.create_match,2,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,0,
                    FontWeight.w600,fontfamily: false),
              ),


              Padding(
                padding:  EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.05),
                child: const Divider(height:1,thickness:1,color: CommonColors.lightgrayColor,),
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.02,
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
                            CommonColors.black, Strings.match_title,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            "name",
                            context,
                            false,
                            CommonColors.textfiled_gray,
                            Strings.match_title,
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
                            CommonColors.black, Strings.select_league,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

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
                            CommonColors.black, Strings.type_match,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

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
                            CommonColors.black, Strings.schedule_match,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color:CommonColors.darkGray)
                            ),
                            height: CommonWidget.getInstance().heightFactor(context) * 0.07,
                            child: Padding(
                              padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.02,right:CommonWidget.getInstance().widthFactor(context) * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.darkGray, Strings.select_date_time,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),

                                  Icon(Icons.calendar_today_outlined,)
                                ],
                              ),
                            ),
                        ),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.match_description,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            "name",
                            context,
                            false,
                            CommonColors.textfiled_gray,
                            Strings.write_match_des_here,
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
                          height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                        ),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.choose_player,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.015,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  CommonWidget.getInstance().normalText(
                                      CommonColors.black,Strings.player1,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,
                                      FontWeight.w600,fontfamily: false),

                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                                  ),


                                  GestureDetector(
                                    onTap:(){

                                    },
                                    child: Container(
                                      width:  CommonWidget.getInstance().widthFactor(context) * 0.24,
                                      height:  CommonWidget.getInstance().widthFactor(context) * 0.24,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                        ),
                                        shape: BoxShape.circle,

                                      ),
                                      child: const Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                          )
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                                  ),



                                  CommonWidget.getInstance().normalText(
                                      CommonColors.darkGray,Strings.choose,0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,1,
                                      FontWeight.w500,fontfamily: false),

                                ],
                              ),

                                  Container(
                                    decoration: const BoxDecoration(
                                      color: CommonColors.lightRed,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: CommonWidget.getInstance().normalText(
                                          CommonColors.red,"vs",0,CommonWidget.getInstance().widthFactor(context)*0.025,FontStyle.normal,0,
                                          FontWeight.w600,fontfamily: false),
                                    ),
                                  ),



                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  CommonWidget.getInstance().normalText(
                                      CommonColors.black,Strings.player2,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,
                                      FontWeight.w600,fontfamily: false),

                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                                  ),

                                  GestureDetector(
                                    onTap:(){

                                    },
                                    child: Container(
                                      width:  CommonWidget.getInstance().widthFactor(context) * 0.24,
                                      height:  CommonWidget.getInstance().widthFactor(context) * 0.24,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                        ),
                                        shape: BoxShape.circle,

                                      ),
                                      child:  const Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                                  ),

                                  CommonWidget.getInstance().normalText(
                                      CommonColors.darkGray,Strings.choose,0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,1,
                                      FontWeight.w500,fontfamily: false),

                                ],
                              ),

                            ],
                          ),
                        ),


                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:6.0),
                          child: CommonWidget.getInstance().flexibleButton(
                            context,
                            Strings.create_match,
                            double.infinity,
                            CommonWidget.getInstance().widthFactor(context) * 0.13,
                            CommonColors.primaryColor1,
                            CommonColors.primaryColor1,
                            CommonColors.white,
                            this,
                          ),
                        ),

                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                        ),

            ]),
          ),
        ),
      ]),
    )));
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    // TODO: implement widgetCallBack
  }
}
