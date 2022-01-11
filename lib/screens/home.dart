import 'package:axe/screens/prevoius_league_detail.dart';
import 'package:axe/screens/upcoming_league_detail.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Home extends StatelessWidget {
   const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.upcoming_league,0,CommonWidget.getInstance().widthFactor(context)*0.055,FontStyle.normal,2,FontWeight.w600),

                    CommonWidget.getInstance().normalText(
                        CommonColors.red, Strings.view_all,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:5,
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

                              Image.asset("assets/images/champion.png",width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                              height: CommonWidget.getInstance().widthFactor(context) * 0.14,),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,"Axe League",1,CommonWidget.getInstance().widthFactor(context)*0.024,FontStyle.normal,1,FontWeight.w900,),

                              SizedBox(
                                height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                              ),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.darkGray,"Started from Ist Nov",1,CommonWidget.getInstance().widthFactor(context)*0.023,FontStyle.normal,0,FontWeight.w600,fontfamily: false),

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
                                      CommonColors.white,"26 Dec",1,CommonWidget.getInstance().widthFactor(context)*0.015,FontStyle.normal,0,FontWeight.w400),
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
                          CommonColors.black, Strings.top_player,0,CommonWidget.getInstance().widthFactor(context)*0.055,FontStyle.normal,2,FontWeight.w600),
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
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:  4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right:16.0),
                          child: Container(
                            color: CommonColors.primaryColor2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right:20),
                                  child: Row(
                                    children: [
                                      scoreWidget("08","Rank",context),

                                      Divider(height:1,thickness:1,color: CommonColors.white,),

                                      scoreWidget("RYAN SMITH","Location Virgenua Beach VA",context),

                                    ],
                                  ),
                                ),

                                Divider(height:10,thickness:1,color: CommonColors.white,),

                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right:20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      scoreWidget("70%","Accuracy",context),
                                      scoreWidget("07","Leagues",context),
                                      scoreWidget("18","Matches",context),
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
                          CommonColors.black, Strings.previous_league,0,CommonWidget.getInstance().widthFactor(context)*0.055,FontStyle.normal,2,FontWeight.w600),
                    ),


                    CommonWidget.getInstance().normalText(
                        CommonColors.red, Strings.view_all,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),

                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  3,
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

                                leading:  Image.asset("assets/images/champion.png",width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                  height: CommonWidget.getInstance().widthFactor(context) * 0.14,) ,

                                title: CommonWidget.getInstance().normalText(
                                    CommonColors.black,"Showme axe throwing league",0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                               subtitle:  CommonWidget.getInstance().normalText(
                                   CommonColors.darkGray,"Season 3",0,CommonWidget.getInstance().widthFactor(context)*0.02,FontStyle.normal,2,FontWeight.w600),


                                trailing: Icon(Icons.arrow_forward_ios_outlined,size: CommonWidget.getInstance().heightFactor(context) * 0.02,),


                              ),
                            ),
                     //   ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
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
}

