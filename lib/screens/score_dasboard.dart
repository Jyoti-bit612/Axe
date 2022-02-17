import 'dart:convert';

import 'package:axe/controller/current_league_controller.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ScoreDashboard extends StatelessWidget implements CallBackInterface  {
  List<String> player1ListScore=[];
  List<String> player2ListScore=[];
  var type,player1killshot,player2killshot,sdthrowPlayer1,sdthrowPlayer2;

  @override
  Widget build(BuildContext context) {
    final CurrentLeagueController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: (){
                    Get.back();
                  }, icon: const Icon(Icons.arrow_back_rounded)),

                  Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: CommonWidget.getInstance().flexibleButton(
                      context,
                      Strings.end_game,
                      CommonWidget.getInstance().widthFactor(context) * 0.32,
                      CommonWidget.getInstance().widthFactor(context) * 0.13,
                      CommonColors.primaryColor1,
                      CommonColors.primaryColor1,
                      CommonColors.white,
                      this,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.02,
              ),

              Obx(()=>Card(
                  elevation: 4,
                  child:Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidget.getInstance().normalText(
                                CommonColors.black,
                                controller.currentLeagueDetailPojo.value.leagueDetails==null?"":
                                controller.currentLeagueDetailPojo.value.leagueDetails!.leagueTitle.toString(),
                                0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                            controller.currentLeagueDetailPojo.value.currentMatch==null?Container():
                            controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?Container():
                            Container(
                              decoration: BoxDecoration(
                                  color: CommonColors.red,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(color:CommonColors.red)
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CommonWidget.getInstance().normalText(
                                    CommonColors.white,Strings.live_match,0,CommonWidget.getInstance().widthFactor(context)*0.018,FontStyle.normal,1,FontWeight.w900,fontfamily: false),
                              ),

                            )
                          ],
                        ),
                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                        ),


                        CommonWidget.getInstance().normalText(
                            CommonColors.darkGray,
                            controller.currentLeagueDetailPojo.value.leagueDetails==null?"":
                            controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?""+"Season"+controller.currentLeagueDetailPojo.value.leagueDetails!.season.toString():
                            controller.currentLeagueDetailPojo.value.currentMatch![0].matchTitle.toString()+"/Season"+controller.currentLeagueDetailPojo.value.leagueDetails!.season.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.019,FontStyle.normal,0,FontWeight.w900,fontfamily: false),

                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                        ),


                        Center(
                          child: controller.currentLeagueDetailPojo.value.currentMatch==null?Container():
                          controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?
                          Global.setEmptyText("No Current Match", context):Container(),
                        ),

                        controller.currentLeagueDetailPojo.value.currentMatch==null?Container():
                        controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?Container():
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: (){
                                Get.toNamed('/otherUserProfile');
                              },
                              child: Container(
                                width:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                                height:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  ),
                                  shape: BoxShape.circle,

                                ),
                                child:Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child:
                                  controller.currentLeagueDetailPojo.value.currentMatch!.isNotEmpty?
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player1WithScore!=null?
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player1WithScore!.playerDetail!.picture!=null?
                                  CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(Constant.imageUrl+controller.currentLeagueDetailPojo.value.currentMatch![0].player1WithScore!.playerDetail!.picture!),
                                  ):
                                  imageBox():
                                  imageBox():
                                  imageBox(),
                                ),
                              ),
                            ),

                            CommonWidget.getInstance().normalText(
                                CommonColors.black,"00 : 00",0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,
                                FontWeight.w900,fontfamily: false),

                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: (){
                                Get.toNamed('/otherUserProfile');

                              },
                              child: Container(
                                width:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                                height:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  ),
                                  shape: BoxShape.circle,

                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child:
                                  controller.currentLeagueDetailPojo.value.currentMatch!.isNotEmpty?
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player2WithScore!=null?
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player2WithScore!.playerDetail!.picture!=null?
                                  CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(Constant.imageUrl+controller.currentLeagueDetailPojo.value.currentMatch![0].player2WithScore!.playerDetail!.picture!),
                                  ):
                                  imageBox():
                                  imageBox():
                                  imageBox(),
                                ),
                              ),
                            )
                          ],
                        ),

                        controller.currentLeagueDetailPojo.value.currentMatch==null?Container():
                        controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?Container():
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,
                                  controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?"Player1":
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player1WithScore==null?"Player1":
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player1WithScore!.playerDetail!.firstName.toString(),
                                  0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),


                              CommonWidget.getInstance().normalText(
                                  CommonColors.red,"vs",0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),


                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,
                                  controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?"Player2":
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player2WithScore==null?"Player2":
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].player2WithScore!.playerDetail!.firstName.toString(),
                                  0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              )),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset("assets/images/score.png",width:CommonWidget.getInstance().widthFactor(context)*0.3),

                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?0:
                        controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?6:11,
                        itemBuilder: (context, index) {

                          if(player1ListScore.isEmpty){
                            type=controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10;
                            player1ListScore=List.filled(controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10, "0");
                          }
                          if( player2ListScore.isEmpty){
                            type=controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10;
                            player2ListScore=List.filled(controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10, "0");
                          }

                          return Padding(
                            padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context)*0.045,
                                right:CommonWidget.getInstance().widthFactor(context)*0.045),
                            child: Table(
                              defaultColumnWidth: FixedColumnWidth(CommonWidget.getInstance().widthFactor(context)*0.1),
                              border: TableBorder.all(
                                  color: CommonColors.black,
                                  style: BorderStyle.solid,
                                  width: 1),

                              children: [
                                TableRow(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                            child: TextFormField(
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration.collapsed(
                                                hintText: '0',
                                              ),
                                              onChanged: (String? value) {
                                                player1ListScore[index]=value.toString();
                                              },
                                            )
                                          ),
                                        ],
                                      ),

                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                            child: TextFormField(
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration.collapsed(
                                                hintText: '0',
                                              ),
                                              onChanged: (String? value) {
                                                player2ListScore[index]=value.toString();
                                              },
                                            )
                                          ),
                                        ],
                                      ),
                                    ]
                                ),
                              ],
                            )
                          );
                        }),
                  ),


                  Image.asset("assets/images/score.png",width:CommonWidget.getInstance().widthFactor(context)*0.3,)
                ],
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget(Strings.call_killshot,CommonWidget.getInstance().widthFactor(context) * 0.34,context),

                  Container(
                    color: CommonColors.black,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.white,"0",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                          FontWeight.w600,fontfamily: false),
                    ) ,

                  ),

                  Container(
                    color: CommonColors.black,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.white,"0",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                          FontWeight.w600,fontfamily: false),
                    ) ,
                  ),

                  buttonWidget(Strings.call_killshot,CommonWidget.getInstance().widthFactor(context) * 0.34,context),

                ],
              ),


              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget(Strings.winner,CommonWidget.getInstance().widthFactor(context) * 0.4,context),
                  buttonWidget(Strings.winner,CommonWidget.getInstance().widthFactor(context) * 0.4,context),

                ],
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget(Strings.sudden_death_throw,CommonWidget.getInstance().widthFactor(context) * 0.4,context),
                  buttonWidget(Strings.sudden_death_throw,CommonWidget.getInstance().widthFactor(context) * 0.4,context),

                ],
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left:6.0),
                child: CommonWidget.getInstance().flexibleButton(
                  context,
                  Strings.update_score,
                  double.infinity,
                  CommonWidget.getInstance().widthFactor(context) * 0.13,
                  CommonColors.primaryColor1,
                  CommonColors.primaryColor1,
                  CommonColors.white,
                  this,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

  Widget imageBox(){
    final CurrentLeagueController controller = Get.find();
    return const CircleAvatar(
        radius: 30.0,
        backgroundColor: CommonColors.textfiled_gray,
        backgroundImage:AssetImage("assets/images/dummypic.jpg")
    );
  }

  buttonWidget(String text,double width,BuildContext context) {
    return SizedBox(
      height: CommonWidget.getInstance().widthFactor(context) * 0.1,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: CommonColors.darkGray)

              )),

          onPressed: () {

            switch(text){

              case Strings.sudden_death_throw:

                break;

              case Strings.call_killshot:

                break;

              case Strings.winner:

                break;
            }
          },

          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: CommonColors.darkGray,
                  fontFamily: "Lato",
                  fontSize: CommonWidget.getInstance().widthFactor(context) *
                      0.035,
                  fontWeight: FontWeight.bold))),
    );
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    switch(title){
      case Strings.update_score:
        Global.showLoaderDialog(context);
        var scoreArrayList;

        if(type==10){
           scoreArrayList = <Map<String, String>>[
            {
              'id': "1",
              'throw1': player1ListScore[0],
              'throw2': player1ListScore[1],
              'throw3': player1ListScore[2],
              'throw4': player1ListScore[3],
              'throw5': player1ListScore[4],
              'throw6': player1ListScore[5],
              'throw7': player1ListScore[6],
              'throw8': player1ListScore[7],
              'throw9': player1ListScore[8],
              'throw10':player1ListScore[9],
              'killshot':player1ListScore[9],
              'suddendeaththrow':player1ListScore[9],
            },
            {
              'id': "2",
              'throw1':  player2ListScore[0],
              'throw2':  player2ListScore[1],
              'throw3':  player2ListScore[2],
              'throw4':  player2ListScore[3],
              'throw5':  player2ListScore[4],
              'throw6':  player2ListScore[5],
              'throw7':  player2ListScore[6],
              'throw8':  player2ListScore[7],
              'throw9':  player2ListScore[8],
              'throw10': player2ListScore[9],
              'killshot':player1ListScore[9],
              'suddendeaththrow':player1ListScore[9],

            },
          ];
        }else{

          scoreArrayList = <Map<String, String>>[
            {
              'id': "1",
              'throw1': player1ListScore[0],
              'throw2': player1ListScore[1],
              'throw3': player1ListScore[2],
              'throw4': player1ListScore[3],
              'throw5': player1ListScore[4],
              'killshot':player1ListScore[9],
              'suddendeaththrow':player1ListScore[9],            },
            {
              'id': "2",
              'throw1':  player2ListScore[0],
              'throw2':  player2ListScore[1],
              'throw3':  player2ListScore[2],
              'throw4':  player2ListScore[3],
              'throw5':  player2ListScore[4],
              'killshot':player1ListScore[9],
              'suddendeaththrow':player1ListScore[9],
            },
          ];
        }


        var jsonBody={
          "scoreArray":scoreArrayList
        };

          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          Global.postData(context,Constant.updateScore,"updateScoreApi",jsonBody,this);

        break;

      case "updateScoreApi":
        Get.back();
        Global.showSnackBar(context,  json.decode(value)["message"].toString());

        break;

  }
  }
}

