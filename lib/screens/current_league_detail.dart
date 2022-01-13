import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/create_match.dart';
import 'package:axe/screens/other_user_profile.dart';
import 'package:axe/screens/playerlist.dart';
import 'package:axe/screens/score_dasboard.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/global.dart';import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  CommonColors.black,"AXE WORLD LEAGUE",0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

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
                         CommonColors.darkGray,"Match 04/ Season 5",0,CommonWidget.getInstance().widthFactor(context)*0.019,FontStyle.normal,0,FontWeight.w900,fontfamily: false),

                         SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: (){
                                  Get.to( ()=>OtherUserProfile());

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
                                  child:  const Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                      )
                                  ),
                                ),
                              ),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,"05 : 07",0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,
                                  FontWeight.w900,fontfamily: false),

                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: (){
                                  Get.to( ()=>OtherUserProfile());
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
                                  child:  const Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [

                                CommonWidget.getInstance().normalText(
                                    CommonColors.black,"Ragnar",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                    FontWeight.w600,fontfamily: false),


                                CommonWidget.getInstance().normalText(
                                    CommonColors.red,"vs",0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,0,
                                    FontWeight.w600,fontfamily: false),


                                CommonWidget.getInstance().normalText(
                                    CommonColors.black,"Floki",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                    FontWeight.w600,fontfamily: false),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Get.to(()=>const ScoreDashboard());
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
                  visible: Global.loginType=="1"?true:false,
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
                  indicatorPadding: EdgeInsets.only(top:CommonWidget.getInstance().widthFactor(context) * 0.1),
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
    );
  }

  matchedWidget(){
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount:  5,
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
                                  Get.to(()=>const PlayerList());

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
                                  CommonColors.black,"David",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,
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
                                  CommonColors.darkGray,"Match 04/ Season 5",0,CommonWidget.getInstance().widthFactor(context)*0.025,FontStyle.normal,0,FontWeight.w900,fontfamily: false),


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
                                      CommonColors.white,"26m 25 hr",1,CommonWidget.getInstance().widthFactor(context)*0.017,FontStyle.normal,0,FontWeight.w400),
                                ),

                              ),

                              ],
                            ),


                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Get.off(()=>const PlayerList());

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
                                  CommonColors.black,"David",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,
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
          visible: Global.loginType=="1"?false:true,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CommonWidget.getInstance().flexibleButton(
                context,
                Strings.create_match,
                CommonWidget.getInstance().widthFactor(context) * 0.42,
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

  playerWidget(){
    return   Column(
      children: [
        Expanded(
          child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              itemCount:  4,
              separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.to( ()=>OtherUserProfile());

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
                          padding: const EdgeInsets.all(1.0),
                          child: DecoratedBox(
                              decoration:  const BoxDecoration(
                                color: CommonColors.textfiled_gray,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset("assets/images/profile.png")),
                        ),
                      ),

                      title: CommonWidget.getInstance().normalText(
                          CommonColors.black,"David",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                      subtitle:  CommonWidget.getInstance().normalText(
                          CommonColors.darkGray,"Location: Southfield",0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w600),

                    ),
                  ),
                  //   ),
                );
              }),
        ),

        Visibility(
          visible: Global.loginType=="1"?false:true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CommonWidget.getInstance().normalText(
                    CommonColors.primaryColor1, Strings.add_more_player,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600),

                SizedBox(
                  width: CommonWidget.getInstance().widthFactor(context) * 0.02,
                ),
                Icon(Icons.add_circle_outline_rounded,color: CommonColors.primaryColor1,)
              ],
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

