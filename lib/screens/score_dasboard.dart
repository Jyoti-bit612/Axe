import 'dart:convert';
import 'package:axe/controller/current_league_controller.dart';
import 'package:axe/controller/score_controller.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreDashboard extends StatelessWidget implements CallBackInterface  {

  var type,player1killshot,player2killshot,sdthrowPlayer1,sdthrowPlayer2;

  @override
  Widget build(BuildContext context) {
    final CurrentLeagueController controller = Get.find();
    final ScoreDashController scoreController = Get.find();
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

             Card(
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
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore!.isNotEmpty?
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![0].playerDetail!.picture!=null?
                                  CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(Constant.imageUrl+controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![0].playerDetail!.picture!),
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
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore!.isNotEmpty?
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![1].playerDetail!.picture!=null?
                                  CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(Constant.imageUrl+controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![1].playerDetail!.picture!),
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
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore!.isEmpty?"Player1":
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![0].playerDetail!.firstName.toString(),
                                  0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),


                              CommonWidget.getInstance().normalText(
                                  CommonColors.red,"vs",0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),


                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,
                                  controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?"Player2":
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore!.isEmpty?"Player2":
                                  controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![1].playerDetail!.firstName.toString(),
                                  0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset("assets/images/score.png",width:CommonWidget.getInstance().widthFactor(context)*0.3),

                  Obx(()=> Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?0:
                        controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?6:11,
                        itemBuilder: (context, index) {

                          if(scoreController.player1ListScore.isEmpty){
                            type=controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10;
                            scoreController.player1ListScore=List.filled(controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10, "");

                            if(scoreController.scorePojo.value.data!=null && scoreController.scorePojo.value.data!.length>0){

                              scoreController.player1ListScore[0]=scoreController.scorePojo.value.data![0].throw1.toString();
                              scoreController.player1ListScore[1]=scoreController.scorePojo.value.data![0].throw2.toString();
                              scoreController.player1ListScore[2]=scoreController.scorePojo.value.data![0].throw3.toString();
                              scoreController.player1ListScore[3]=scoreController.scorePojo.value.data![0].throw4.toString();
                              scoreController.player1ListScore[4]=scoreController.scorePojo.value.data![0].throw5.toString();
                              if(type==10){
                               scoreController.player1ListScore[5]=scoreController.scorePojo.value.data![0].throw6.toString();
                               scoreController.player1ListScore[6]=scoreController.scorePojo.value.data![0].throw7.toString();
                               scoreController.player1ListScore[7]=scoreController.scorePojo.value.data![0].throw8.toString();
                               scoreController.player1ListScore[8]=scoreController.scorePojo.value.data![0].throw9.toString();
                               scoreController.player1ListScore[9]=scoreController.scorePojo.value.data![0].throw10.toString();
                              }

                            }

                          }
                          if( scoreController.player2ListScore.isEmpty){
                            type=controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10;
                            scoreController.player2ListScore=List.filled(controller.currentLeagueDetailPojo.value.currentMatch![0].matchType.toString()=="3"?5:10,"");

                            if(scoreController.scorePojo.value.data!=null && scoreController.scorePojo.value.data!.length>0  ){
                              scoreController.player2ListScore[0]=scoreController.scorePojo.value.data![1].throw1.toString();
                            scoreController.player2ListScore[1]=scoreController.scorePojo.value.data![1].throw2.toString();
                            scoreController.player2ListScore[2]=scoreController.scorePojo.value.data![1].throw3.toString();
                            scoreController.player2ListScore[3]=scoreController.scorePojo.value.data![1].throw4.toString();
                            scoreController.player2ListScore[4]=scoreController.scorePojo.value.data![1].throw5.toString();
                              if(type==10){
                               scoreController.player2ListScore[5]=scoreController.scorePojo.value.data![1].throw6.toString();
                               scoreController.player2ListScore[6]=scoreController.scorePojo.value.data![1].throw7.toString();
                               scoreController.player2ListScore[7]=scoreController.scorePojo.value.data![1].throw8.toString();
                               scoreController.player2ListScore[8]=scoreController.scorePojo.value.data![1].throw9.toString();
                               scoreController.player2ListScore[9]=scoreController.scorePojo.value.data![1].throw10.toString();
                              }
                            }}

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
                                index==0?
                                    TableRow(
                                      children:[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: CommonWidget.getInstance().normalText(
                                                CommonColors.black,
                                                "- Match -",
                                                0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w900,fontfamily: false),
                                          ),
                                        )

                                      ]
                                    )
                             :
                                TableRow(
                                    children: [

                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                            child: TextFormField(
                                              controller: TextEditingController(text: scoreController.player1ListScore[index-1]),
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration.collapsed(
                                                hintText: '0',
                                              ),
                                              onChanged: (String? value) {
                                                scoreController.player1ListScore[index-1]=value.toString();
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
                                              controller:  TextEditingController(text: scoreController.player2ListScore[index-1]),
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration.collapsed(
                                                hintText: '0',
                                              ),
                                              onChanged: (String? value) {
                                                scoreController.player2ListScore[index-1]=value.toString();
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
                  )),


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
    final CurrentLeagueController controller = Get.find();
    final ScoreDashController scoreController = Get.find();

    switch(title){
      case Strings.update_score:
        Global.showLoaderDialog(context);
        var scoreArrayList;

        if(type==10){
           scoreArrayList = <Map<String, String>>[
            {
              'id': controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![0].id.toString(),
              'throw1': scoreController.player1ListScore[0],
              'throw2': scoreController.player1ListScore[1],
              'throw3': scoreController.player1ListScore[2],
              'throw4': scoreController.player1ListScore[3],
              'throw5': scoreController.player1ListScore[4],
              'throw6': scoreController.player1ListScore[5],
              'throw7': scoreController.player1ListScore[6],
              'throw8': scoreController.player1ListScore[7],
              'throw9': scoreController.player1ListScore[8],
              'throw10':scoreController.player1ListScore[9],
              'killshot':scoreController.player1ListScore[9],
              'suddendeaththrow':scoreController.player1ListScore[9],
            },
            {
              'id': controller.currentLeagueDetailPojo.value.currentMatch![0].playersWithScore![1].id.toString(),
              'throw1':  scoreController.player2ListScore[0],
              'throw2':  scoreController.player2ListScore[1],
              'throw3':  scoreController.player2ListScore[2],
              'throw4':  scoreController.player2ListScore[3],
              'throw5':  scoreController.player2ListScore[4],
              'throw6':  scoreController.player2ListScore[5],
              'throw7':  scoreController.player2ListScore[6],
              'throw8':  scoreController.player2ListScore[7],
              'throw9':  scoreController.player2ListScore[8],
              'throw10': scoreController.player2ListScore[9],
              'killshot':scoreController.player1ListScore[9],
              'suddendeaththrow':scoreController.player1ListScore[9],

            },
          ];
        }else{

          scoreArrayList = <Map<String, String>>[
            {
              'id': "1",
              'throw1': scoreController.player1ListScore[0],
              'throw2': scoreController.player1ListScore[1],
              'throw3': scoreController.player1ListScore[2],
              'throw4': scoreController.player1ListScore[3],
              'throw5': scoreController.player1ListScore[4],
              'killshot':scoreController.player1ListScore[9],
              'suddendeaththrow':scoreController.player1ListScore[9],
            },
            {
              'id': "2",
              'throw1':  scoreController.player2ListScore[0],
              'throw2':  scoreController.player2ListScore[1],
              'throw3':  scoreController.player2ListScore[2],
              'throw4':  scoreController.player2ListScore[3],
              'throw5':  scoreController.player2ListScore[4],
              'killshot':scoreController.player1ListScore[9],
              'suddendeaththrow':scoreController.player1ListScore[9],
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

