import 'package:axe/controller/current_league_controller.dart';
import 'package:axe/controller/score_controller.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/create_match.dart';
import 'package:axe/util/common_arguments.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CurrentLeagueDetail extends StatefulWidget {
  const CurrentLeagueDetail({Key? key}) : super(key: key);

  @override
  _CurrentLeagueDetailState createState() => _CurrentLeagueDetailState();
}

class _CurrentLeagueDetailState extends State<CurrentLeagueDetail> with SingleTickerProviderStateMixin implements CallBackInterface  {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget imageBox(){
    final CurrentLeagueController controller = Get.find();
    return const CircleAvatar(
        radius: 30.0,
        backgroundColor: CommonColors.textfiled_gray,
        backgroundImage:AssetImage("assets/images/dummypic.jpg")
    );
  }

  @override
  Widget build(BuildContext context) {
    final CurrentLeagueController controller = Get.find();
    final ScoreDashController scoreController = Get.find();

    return Obx(()=>SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                          controller.currentLeagueDetailPojo.value.currentMatch==null?Container():
                          controller.currentLeagueDetailPojo.value.currentMatch!.isEmpty?Container():
                          GestureDetector(
                            onTap: ()  {
                              scoreController.matchId.value= controller.currentLeagueDetailPojo.value.currentMatch![0].id.toString();

                              scoreController.getScoreMatch();
                              Get.toNamed('/scoreDashboard');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: CommonWidget.getInstance().normalText(
                                    CommonColors.primaryColor1,Strings.view_all_stats,0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                    FontWeight.w600,fontfamily: false),
                              ),
                            ),
                          ),
                        ],
            ),
                    )
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.06,
                ),
                Visibility(
                  visible: Global.loginType=="2"?true:false,
                  child: Center(
                    child: CommonWidget.getInstance().flexibleButton(
                      context,
                      Strings.join_league,
                      CommonWidget.getInstance().widthFactor(context) * 0.37,
                      CommonWidget.getInstance().widthFactor(context) * 0.13,
                      CommonColors.primaryColor1,
                      CommonColors.primaryColor1,
                      CommonColors.white,
                      this,
                    ),
                  ),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.04,
                ),

                TabBar(
                      labelColor: CommonColors.black,
                  unselectedLabelColor: CommonColors.black,
                  controller: _tabController,
                 // indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.only(top:43),
                  indicatorWeight: 0.1,
                  //labelPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      indicator:  const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CommonColors.primaryColor1,
                            CommonColors.imageRed,
                          ],
                        ),
                      ),

                  tabs: const [
                    Tab(
                      text:Strings.matches,),

                    Tab(
                          text:Strings.player ,
                        ),
                   ],

                  ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.6,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: <Widget>[
                        matchedWidget(),
                        playerWidget(),
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    ));
  }

  matchedWidget(){
    final CurrentLeagueController controller = Get.find();
    return Column(
      children: [
          controller.currentLeagueDetailPojo.value.matches==null?
          Global.setEmptyText("No Matches",context):
          controller.currentLeagueDetailPojo.value.matches!.isEmpty?
          Global.setEmptyText("No Matches",context):
          Expanded(
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount:    controller.currentLeagueDetailPojo.value.matches!.length,
                itemBuilder: (context, index) {
                  return  Card(
                      elevation: 4,
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    // Get.toNamed('/playerlist',arguments: 1);
                                    Get.toNamed('/playerlist',arguments: [{CommonArguments.argPlayerType: 1,
                                      CommonArguments.argNavigationType: "change_player",CommonArguments.argMatchId: controller.currentLeagueDetailPojo.value.matches![index].id}]
                                    );
                                  },
                                  child: Container(
                                    width:  CommonWidget.getInstance().widthFactor(context) * 0.16,
                                    height:  CommonWidget.getInstance().widthFactor(context) * 0.16,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                      ),
                                      shape: BoxShape.circle,

                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child:
                                      controller.currentLeagueDetailPojo.value.matches![index].playersWithScore!.isEmpty?
                                        imageBox():
                                        controller.currentLeagueDetailPojo.value.matches![index].playersWithScore![0].playerDetail!.picture== null ?
                                        imageBox():
                                        CircleAvatar(
                                        backgroundImage:
                                        NetworkImage(Constant.imageUrl+controller.currentLeagueDetailPojo.value.matches![index].playersWithScore![0].playerDetail!.picture!),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                                ),

                                CommonWidget.getInstance().normalText(
                                    CommonColors.black,
                                    controller.currentLeagueDetailPojo.value.matches![index].playersWithScore!.isEmpty?"No Player":
                                    controller.currentLeagueDetailPojo.value.matches![index].playersWithScore![0].playerDetail!.firstName.toString()
                                    ,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,
                                    FontWeight.w600,fontfamily: false),

                                CommonWidget.getInstance().normalText(
                                    CommonColors.darkGray,Strings.change_player,0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,1,
                                    FontWeight.w500,fontfamily: false),
                              ],
                            ),

                            Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                CommonWidget.getInstance().normalText(
                                    CommonColors.darkGray,controller.currentLeagueDetailPojo.value.matches![index].matchTitle!+" / Season"+
                                    controller.currentLeagueDetailPojo.value.leagueDetails!.season!
                                    ,0,CommonWidget.getInstance().widthFactor(context)*0.025,FontStyle.normal,0,FontWeight.w900,fontfamily: false),


                                SizedBox(
                                  height: CommonWidget.getInstance().widthFactor(context) * 0.02,
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


                                SizedBox(
                                  height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                                ),

                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: CommonColors.primaryColor1,

                                  ),
                                  child:
                                  Padding(
                                    padding: const EdgeInsets.only(left:10,right:10,top:2.5,bottom:3),
                                    child: CommonWidget.getInstance().normalText(
                                        CommonColors.white,getStartDate(controller.currentLeagueDetailPojo.value.matches![index].matchSchedule),1,CommonWidget.getInstance().widthFactor(context)*0.017,FontStyle.normal,0,FontWeight.w400),
                                  ),
                                ),
                                ],
                              ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    // Get.offNamed('/playerlist',arguments: 2);
                                    Get.toNamed('/playerlist',arguments: [{CommonArguments.argPlayerType: 2,
                                      CommonArguments.argNavigationType: "change_player",CommonArguments.argMatchId: controller.currentLeagueDetailPojo.value.matches![index].id}]
                                    );
                                  },
                                  child: Container(
                                    width:  CommonWidget.getInstance().widthFactor(context) * 0.16,
                                    height:  CommonWidget.getInstance().widthFactor(context) * 0.16,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child:   Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child:controller.currentLeagueDetailPojo.value.matches![index].playersWithScore!.isEmpty?imageBox():
                                        controller.currentLeagueDetailPojo.value.matches![index].playersWithScore![1].playerDetail!.picture== null ? imageBox()
                                            :CircleAvatar(
                                          backgroundImage:
                                          NetworkImage(Constant.imageUrl+controller.currentLeagueDetailPojo.value.matches![index].playersWithScore![1].playerDetail!.picture!),
                                        ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                                ),
                                CommonWidget.getInstance().normalText(
                                    CommonColors.black,
                                    controller.currentLeagueDetailPojo.value.matches![index].playersWithScore!.isEmpty?"No Player":
                                    controller.currentLeagueDetailPojo.value.matches![index].playersWithScore![1].playerDetail!.firstName.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,
                                    FontWeight.w600,fontfamily: false),

                                CommonWidget.getInstance().normalText(
                                    CommonColors.darkGray,Strings.change_player,0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,1,
                                    FontWeight.w500,fontfamily: false),
                              ],
                            ),
                          ],
                        ),
                      )
                  );
                }),
          ),

        Visibility(
          visible: Global.loginType=="2"?false:true,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CommonWidget.getInstance().flexibleButton(
                context,
                Strings.create_match,
                CommonWidget.getInstance().widthFactor(context) * 0.35,
                CommonWidget.getInstance().widthFactor(context) * 0.13,
                CommonColors.primaryColor1,
                CommonColors.primaryColor1,
                CommonColors.white,
                this,
              )),
        ),
      ],
    );
  }

  DateFormat dateFormat = DateFormat("dd MMM HH:mm");

  String getStartDate(var date) {
    var mDate1= DateTime.parse(date);
    return dateFormat.format(mDate1);
  }

  playerWidget(){
    final CurrentLeagueController controller = Get.find();
    return   Column(
      children: [
        controller.currentLeagueDetailPojo.value.players==null?
        Global.setEmptyText("No Players",context):
        controller.currentLeagueDetailPojo.value.players!.isEmpty?
        Global.setEmptyText("No Players",context)
            : Expanded(
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                itemCount:  controller.currentLeagueDetailPojo.value.players!.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed('/otherUserProfile');
                      },
                      child: ListTile(
                        leading: Container(
                          width:  CommonWidget.getInstance().widthFactor(context) * 0.15,
                          height:  CommonWidget.getInstance().widthFactor(context) * 0.15,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle,

                          ),
                          child: Padding(
                            padding:  const EdgeInsets.all(1.0),
                            child: DecoratedBox(
                                decoration:  const BoxDecoration(
                                  color: CommonColors.textfiled_gray,
                                  shape: BoxShape.circle,
                                ),
                                child:controller.currentLeagueDetailPojo.value.players![index].picture== null ?const CircleAvatar(
                                  backgroundColor: CommonColors.textfiled_gray,
                                  backgroundImage: AssetImage("assets/images/profile.png"),

                                ):CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                  NetworkImage(Constant.imageUrl+controller.currentLeagueDetailPojo.value.players![index].picture!),
                                ),
                            ),
                        )),

                        title: CommonWidget.getInstance().normalText(
                            CommonColors.black,controller.currentLeagueDetailPojo.value.players![index].firstName.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                        subtitle:  CommonWidget.getInstance().normalText(
                            CommonColors.darkGray,"Location: "+ controller.currentLeagueDetailPojo.value.players![index].city.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w600),

                      ),
                    ),
                    //   ),
                  );
                }),
            ),

        Visibility(
          visible: Global.loginType=="1"?false:false, // No need of add more player here ...for future use if required
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Get.toNamed('/playerlist',arguments: [{CommonArguments.argPlayerType: 1}]);
              },
              child: Row(
                children: [
                  CommonWidget.getInstance().normalText(
                      CommonColors.primaryColor1, Strings.add_more_player,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600),
                  SizedBox(
                    width: CommonWidget.getInstance().widthFactor(context) * 0.02,
                  ),
                  const Icon(Icons.add_circle_outline_rounded,color: CommonColors.primaryColor1,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    switch(title){
      case Strings.create_match:
        Get.off(()=> CreateMatch());
        break;

    }
  }
}

