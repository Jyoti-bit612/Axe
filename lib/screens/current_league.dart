import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/current_league_detail.dart';
import 'package:axe/screens/upcoming_league_detail.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';

class CurrentLeague extends StatefulWidget {
  const CurrentLeague({Key? key}) : super(key: key);

  @override
  _CurrentLeagueState createState() => _CurrentLeagueState();
}


class _CurrentLeagueState extends State<CurrentLeague> implements CallBackInterface {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.current_league,0,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),

                ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CurrentLeagueDetail()));

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

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.05,
                ),

                Row(
                  children: [
                    Expanded(
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.upcoming_league,0,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),
                    ),

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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpcomingLeagueDetail()));

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


              ],
            ),
          ),
        ),
      ),
    );
  }



  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    // TODO: implement widgetCallBack
  }
}

