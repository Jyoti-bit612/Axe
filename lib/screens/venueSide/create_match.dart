import 'dart:convert';
import 'package:axe/controller/league_controller.dart';
import 'package:axe/controller/player_controller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/common_arguments.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateMatch extends StatelessWidget implements CallBackInterface{
  CreateMatch({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleFocus = FocusNode();
  final desFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LeagueController controller = Get.find();
    final PlayerController playerController = Get.find();

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
                  constraints: const BoxConstraints(),
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
                            titleController,
                            TextInputType.emailAddress,
                            titleFocus,
                            null,
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


                        Obx(()=>SizedBox(
                            height:
                            CommonWidget.getInstance().heightFactor(context) *
                                0.09,
                            child:controller.matchTypeList.isNotEmpty?
                            DropDownClass(
                                CommonColors.darkGray,
                                "leagueDropDown",
                                controller.leagueList.isNotEmpty?
                                controller.leagueList.value[0]["league_title"]:"",
                                controller.leagueList.value,
                                this,
                                "0",
                                false,
                                true)
                                :Container()
                        )),


                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.type_match,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        /*Obx(()=>*/SizedBox(
                            height:
                            CommonWidget.getInstance().heightFactor(context) *
                                0.09,
                            child:controller.matchTypeList.isNotEmpty?
                            DropDownClass(
                                CommonColors.darkGray,
                                "matchTypeDropDown",
                                controller.matchTypeList.value[0]["name"],
                                controller.matchTypeList.value,
                                this,
                                "0",
                                false,
                                true)
                                :Container()
                        )/*)*/,

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.schedule_match,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        GestureDetector(
                          onTap: (){
                            CommonWidget.getInstance().datePickerDialog(context, this, "StartDate");
                          },
                          child: Container(
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
                                        CommonColors.black, controller.startDate.value,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w200),

                                    Icon(Icons.calendar_today_outlined,color: CommonColors.primaryColor2,)
                                  ],
                                ),
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
                            descriptionController,
                            TextInputType.emailAddress,
                            desFocus,
                            null,
                            false,
                            false,
                            "email",
                            0),

                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                        ),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black,
                            Strings.choose_player,
                            0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

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
                                      Get.toNamed(Strings.screenPlayerList,arguments: [{CommonArguments.argPlayerType: 1}]);
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

                                  Obx(()=>CommonWidget.getInstance().normalText(
                                      CommonColors.darkGray,
                                      playerController.player1List.isNotEmpty?
                                      playerController.player1List.value.join(","):
                                      Strings.choose,
                                      0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,1,
                                      FontWeight.w500,fontfamily: false)),
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
                                      Get.toNamed(Strings.screenPlayerList,arguments: [{CommonArguments.argPlayerType: 2}]);

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

                                  Obx(()=> CommonWidget.getInstance().normalText(
                                      CommonColors.darkGray,
                                      playerController.player2List.isNotEmpty?
                                      playerController.player2List.value.join(","):
                                      Strings.choose,
                                      0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,1,
                                      FontWeight.w500,fontfamily: false)),
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

  var leagueId="",matchTypeId="";

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    final LeagueController controller = Get.find();
    final PlayerController playerController = Get.find();

    switch(title){
      case Strings.create_match:
        if(CommonWidget.getInstance().isValidate(formKey)){
          if(controller.startDate=="") {
            Global.showSnackBar(context, "Please enter in Schedule Match field");
          } else{
            Global.showLoaderDialog(context);
          var  jsonBody  =  {
            "match_title":titleController.text,
            "league_id":leagueId ,
            "match_type":matchTypeId,
            "match_schedule":controller.startDate.toString(),
            "players1_ids":playerController.player1d.toString(),
            "players2_ids":playerController.player2id.toString(),
            "description":descriptionController.text,
          };print(jsonBody);
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          Global.postData(context,Constant.create_match,"createMatchApi",jsonBody,this);
        }}
        break;

      case "createMatchApi":
        Get.back();
        Global.showSnackBar(context, jsonDecode(value)["message"]);
        break;

      case "StartDate":
        controller.startDate(value);
        break;

      case "leagueDropDown":
        var map = json.decode(value);
        leagueId = map["id"].toString();
        break;

      case "matchTypeDropDown":
        var map = json.decode(value);
        matchTypeId = map["id"].toString();
        break;
    }
  }
}
