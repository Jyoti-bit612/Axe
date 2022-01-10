import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingLeagueDetail extends StatefulWidget {
  const UpcomingLeagueDetail({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<UpcomingLeagueDetail> implements CallBackInterface {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_rounded)),

                Center(
                      child: Image.asset("assets/images/champion.png",width:CommonWidget.getInstance().widthFactor(context) * 0.5,
                        height: CommonWidget.getInstance().widthFactor(context) * 0.5,),
                    ),


                CommonWidget.getInstance().normalText(
                    CommonColors.black, "Twisted Axe throwing Championship",1,CommonWidget.getInstance().widthFactor(context)*0.055,FontStyle.normal,2,FontWeight.w600),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.04,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.darkGray, "Battle of the Axes\n2990 Rainbow Drive Youngstown OH 330-503\nBrickmason and Blockmason",1,
                      CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w400),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.player,0,CommonWidget.getInstance().widthFactor(context)*0.055,FontStyle.normal,2,FontWeight.w600),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),

                Padding(
                  padding: EdgeInsets.only(left:8.0,right:8,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.avatar,0,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,2,FontWeight.w600),

                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.status,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left:8.0,right:8),
                  child: Divider(
                    height: 20,
                      thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                ListView.separated(
                  physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  7,
                    separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top:8.0),
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


                          trailing: CommonWidget.getInstance().normalText(
                              CommonColors.red,"Pending",0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,2,FontWeight.w600),

                        ),
                     //   ),
                      );
                    }),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),

                CommonWidget.getInstance().flexibleButtonWithIcon(
                    context,
                    Strings.invite_player,
                    CommonWidget.getInstance().widthFactor(context)*0.5,
                    CommonWidget.getInstance().widthFactor(context)*0.14,
                    CommonColors.primaryColor1,
                    CommonColors.primaryColor1,
                    CommonColors.white,
                    this,
                    "",
                    CommonColors.white),
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

