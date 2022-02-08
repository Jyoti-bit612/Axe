import 'package:axe/controller/home_controller.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/practice_match.dart';
import 'package:axe/screens/prevoius_league_detail.dart';
import 'package:axe/screens/upcoming_league_detail.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget  implements CallBackInterface{
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: Obx(()=>SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Visibility(
                  visible: Global.loginType=="1"?true:false,
                  child: CommonWidget.getInstance().flexibleButton(
                    context,
                    Strings.play_practice_match,
                    double.infinity,
                    CommonWidget.getInstance().widthFactor(context) * 0.13,
                    CommonColors.primaryColor1,
                    CommonColors.primaryColor1,
                    CommonColors.white,
                    this,
                  ),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.upcoming_league,0,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),

                    Visibility(
                      visible: false,
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.red, Strings.view_all,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                    ),
                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                controller.upcomingLeaguePojo.value.data==null?const CircularProgressIndicator():
                controller.upcomingLeaguePojo.value.data!.isEmpty?
                CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Upcoming League",0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,1,FontWeight.w900,fontfamily: false)
                    :
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:controller.upcomingLeaguePojo.value.data==null?0: controller.upcomingLeaguePojo.value.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: CommonWidget.getInstance().widthFactor(context) * 0.01,
                        mainAxisSpacing: CommonWidget.getInstance().widthFactor(context) * 0.01),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Get.to(()=>const UpcomingLeagueDetail());

                        },
                        child: Card(
                          shadowColor: CommonColors.grayColor,
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                              ),

                              controller.upcomingLeaguePojo.value.data![index].logoPath==null?
                              Image.asset("assets/images/champion.png",
                                width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                height: CommonWidget.getInstance().widthFactor(context) * 0.14,):
                              Image.network(Constant.imageUrl+controller.upcomingLeaguePojo.value.data![index].logoPath!,
                                width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                              height: CommonWidget.getInstance().widthFactor(context) * 0.14,),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,controller.upcomingLeaguePojo.value.data![index].leagueTitle!,1,CommonWidget.getInstance().widthFactor(context)*0.024,FontStyle.normal,1,FontWeight.w900,),

                              SizedBox(
                                height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                              ),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.darkGray,"starting from "+getStartDate(controller.upcomingLeaguePojo.value.data![index].startsFrom!),1,CommonWidget.getInstance().widthFactor(context)*0.023,FontStyle.normal,0,FontWeight.w600,fontfamily: false),

                              SizedBox(
                                height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: CommonColors.primaryColor1,
                                ),
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(left:6,right:6,top:2.5,bottom:3),
                                  child: CommonWidget.getInstance().normalText(
                                      CommonColors.white,getStartDate(controller.upcomingLeaguePojo.value.data![index].endDate!),1,CommonWidget.getInstance().widthFactor(context)*0.015,FontStyle.normal,0,FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.05,
                ),

                Row(
                  children: [
                    Expanded(
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.top_player,0,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right:6.0),
                      child: Container(
                        height:CommonWidget.getInstance().widthFactor(context) * 0.06 ,
                        width: CommonWidget.getInstance().widthFactor(context) * 0.06,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CommonColors.primaryColor1
                        ),
                        child: Icon(Icons.arrow_back_rounded,color: CommonColors.white,size: CommonWidget.getInstance().widthFactor(context) * 0.03,),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:6.0),
                      child: Container(
                        height:CommonWidget.getInstance().widthFactor(context) * 0.06 ,
                        width: CommonWidget.getInstance().widthFactor(context) * 0.06,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CommonColors.primaryColor1

                        ),
                        child: Icon(Icons.arrow_forward,color: CommonColors.white,size:CommonWidget.getInstance().widthFactor(context) * 0.03,),
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.22,
                  child:
                  controller.topPlayer.value.data==null? Container():
                  controller.topPlayer.value.data!.isEmpty?
                  CommonWidget.getInstance().normalText(
                      CommonColors.red,"No Top Player Yet",0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,1,FontWeight.w900,fontfamily: false):
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.topPlayer.value.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right:16.0),
                          child: Container(
                            decoration:  BoxDecoration(
                              color: CommonColors.primaryColor1,
                              /*image: DecorationImage(
                                image:  NetworkImage(Constant.imageUrl+controller.topPlayer.value.data![index].picture!),
                                ),*/
                            ),
                          //  color: CommonColors.primaryColor2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right:20),
                                  child: Row(
                                    children: [
                                      scoreWidget( controller.topPlayer.value.data![index].rankUser.toString(),"Rank",context),

                                      const Divider(height:1,thickness:1,color: CommonColors.white,),

                                      scoreWidget(controller.topPlayer.value.data![index].firstName!+" ".toString()+
                                          controller.topPlayer.value.data![index].lastName!.toString()
                                          ,"Location "+ controller.topPlayer.value.data![index].city.toString()+ ", "+
                                              controller.topPlayer.value.data![index].state.toString()
                                          ,context),
                                    ],
                                  ),
                                ),

                                Divider(height:10,thickness:1,color: CommonColors.white,),

                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right:20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      scoreWidget(controller.topPlayer.value.data![index].accuracyUser.toString(),"Accuracy",context),
                                      scoreWidget(controller.topPlayer.value.data![index].totalLeague.toString(),"Leagues",context),
                                      scoreWidget(controller.topPlayer.value.data![index].totalMatch.toString(),"Matches",context),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                ),

                Row(
                  children: [
                    Expanded(
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.previous_league,0,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),
                    ),


                    Visibility(
                      visible: false,
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.red, Strings.view_all,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                    ),

                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                controller.prevoiusLeaguePojo.value.data==null?const CircularProgressIndicator():
                controller.prevoiusLeaguePojo.value.data!.isEmpty?
                CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Previous League",0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,1,FontWeight.w900,fontfamily: false)
                :ListView.builder(
                  physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.prevoiusLeaguePojo.value.data==null?0: controller.prevoiusLeaguePojo.value.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>const PreviousLeagueDetail());
                        },
                          child: Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(width: 1, color:CommonColors.lightgrayColor)),
                            elevation: 4,

                              child: ListTile(
                                leading:
                                controller.prevoiusLeaguePojo.value.data![index].logoPath==null?
                                Image.asset("assets/images/champion.png",width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                  height: CommonWidget.getInstance().widthFactor(context) * 0.14):
                                Image.network(Constant.imageUrl+controller.upcomingLeaguePojo.value.data![index].logoPath!,
                                  width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                  height: CommonWidget.getInstance().widthFactor(context) * 0.14,),


                                title: CommonWidget.getInstance().normalText(
                                    CommonColors.black,controller.prevoiusLeaguePojo.value.data![index].leagueTitle!,0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                               subtitle:  CommonWidget.getInstance().normalText(
                                   CommonColors.darkGray,"Season "+controller.prevoiusLeaguePojo.value.data![index].season!.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.02,FontStyle.normal,2,FontWeight.w600),


                                trailing: Icon(Icons.arrow_forward_ios_outlined,size: CommonWidget.getInstance().heightFactor(context) * 0.02,),

                              ),
                            ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        )),
      ),
    );
  }

  scoreWidget(String title, String subTitle,BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonWidget.getInstance().normalText(
              CommonColors.white, title,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,0,FontWeight.w600),

          CommonWidget.getInstance().normalText(
              CommonColors.white, subTitle,0,CommonWidget.getInstance().widthFactor(context)*0.025,FontStyle.normal,0,FontWeight.w400),
        ],
      ),
    );
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {

    switch(title){
      case Strings.play_practice_match:

        Get.to(()=>PracticeMatch());

        break;
    }
  }

   DateFormat dateFormat = DateFormat("dd MMM");


   String getStartDate(var date) {
     var mDate1= DateTime.parse(date);
     return dateFormat.format(mDate1);

  }
}

