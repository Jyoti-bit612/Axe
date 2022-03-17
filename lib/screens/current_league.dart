import 'package:axe/controller/current_league_controller.dart';
import 'package:axe/controller/home_controller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CurrentLeague extends StatelessWidget implements CallBackInterface {
  CurrentLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrentLeagueController currentController = Get.find();
    final HomeController controller = Get.find();
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
                Obx(()=>currentController.currentLeaguePojo.value.currentleague==null?
                CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Current League",0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,1,FontWeight.w900,fontfamily: false):
                currentController.currentLeaguePojo.value.currentleague!.isEmpty?
                CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Current League",0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,1,FontWeight.w900,fontfamily: false):
                 ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  currentController.currentLeaguePojo.value.currentleague!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          currentController.currentLeagueID(currentController.currentLeaguePojo.value.currentleague![index].id.toString());
                          currentController.getCurrentLeagueDetail();
                          Get.toNamed('/currentLeagueDetail');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(width: 1, color:CommonColors.lightgrayColor)),
                            elevation: 4,

                            child: ListTile(
                              leading: controller.upcomingLeaguePojo.value.data![index].logoPath==null?
                              Image.asset("assets/images/champion.png",
                                width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                height: CommonWidget.getInstance().widthFactor(context) * 0.14,):
                              Image.network(Constant.imageUrl+currentController.currentLeaguePojo.value.currentleague![index].logoPath.toString(),
                                width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                height: CommonWidget.getInstance().widthFactor(context) * 0.14,),
                              title: CommonWidget.getInstance().normalText(
                                  CommonColors.black,currentController.currentLeaguePojo.value.currentleague![index].leagueTitle!,0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w900,fontfamily: false),
                              subtitle:  CommonWidget.getInstance().normalText(
                                  CommonColors.darkGray,"Season "+ currentController.currentLeaguePojo.value.currentleague![index].season!,0,CommonWidget.getInstance().widthFactor(context)*0.02,FontStyle.normal,2,FontWeight.w600),
                              trailing: Icon(Icons.arrow_forward_ios_outlined,size: CommonWidget.getInstance().heightFactor(context) * 0.02),
                            ),
                          ),
                        ),
                      );
                    })),

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
                        CommonColors.red, "",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                controller.upcomingLeaguePojo.value.data==null? CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Upcoming League",0,CommonWidget.getInstance().widthFactor(context)*0.045,
                    FontStyle.normal,1,FontWeight.w900,fontfamily: false) :
                // const CircularProgressIndicator():
                controller.upcomingLeaguePojo.value.data!.isEmpty?
                CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Upcoming League",0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,1,FontWeight.w900,fontfamily: false)
                    : GridView.builder(
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
                          Get.toNamed('/upcomingLeagueDetail');
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

                              CommonWidget.getInstance().normalText(CommonColors.black,
                                Global.subStringFormat(text: controller.upcomingLeaguePojo.value.data![index].leagueTitle!),
                                1, CommonWidget.getInstance().widthFactor(context)*0.02,FontStyle.normal,1,FontWeight.w900,),
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
              ],
            ),
          ),
        ),
      ),
    );
  }


  DateFormat dateFormat = DateFormat("dd MMM");

  String getStartDate(var date) {
    var mDate1= DateTime.parse(date);
    return dateFormat.format(mDate1);
  }



  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    // TODO: implement widgetCallBack
  }
}

