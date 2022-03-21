import 'package:axe/app.dart';
import 'package:axe/controller/home_controller.dart';
import 'package:axe/controller/prevoius_league_controller.dart';
import 'package:axe/controller/upcoming_league_controller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchList extends StatelessWidget  implements CallBackInterface{
  MatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    final UpcomingLeagueController upcomingController = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,color: CommonColors.black,)),
          backgroundColor: CommonColors.white,elevation: 0.0,
          title: CommonWidget.getInstance().normalText(CommonColors.black, Strings.matches,
            0,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),),
        body: Obx(()=>SingleChildScrollView(
          child: upcomingController.matchListPojo.value.data==null?const Center(child: CircularProgressIndicator()):
          upcomingController.matchListPojo.value.data!.isEmpty?const Center(child: Text("No data")):Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: CommonWidget.getInstance().heightFactor(context) * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget.getInstance().normalText(CommonColors.black, upcomingController.matchListPojo.value.data![0].leagueDetails!.leagueTitle!+" League",
                        0,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),
                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                upcomingController.matchListPojo.value.data==null?CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Upcoming League",0,CommonWidget.getInstance().widthFactor(context)*0.045,
                    FontStyle.normal,1,FontWeight.w900,fontfamily: false):
                // const CircularProgressIndicator():
                upcomingController.matchListPojo.value.data!.isEmpty?
                CommonWidget.getInstance().normalText(
                    CommonColors.red,"No Upcoming League",0,CommonWidget.getInstance().widthFactor(context)*0.045,
                    FontStyle.normal,1,FontWeight.w900,fontfamily: false):
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: upcomingController.matchListPojo.value.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: CommonWidget.getInstance().widthFactor(context) * 0.01,
                        mainAxisSpacing: CommonWidget.getInstance().widthFactor(context) * 0.01),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {

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

                              upcomingController.matchListPojo.value.data![index].logoPath==null?
                              Image.asset("assets/images/champion.png",
                                width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                height: CommonWidget.getInstance().widthFactor(context) * 0.14,):
                              Image.network(Constant.imageUrl+upcomingController.matchListPojo.value.data![index].logoPath!,
                                width:CommonWidget.getInstance().widthFactor(context) * 0.14,
                                height: CommonWidget.getInstance().widthFactor(context) * 0.14,),

                              CommonWidget.getInstance().normalText(CommonColors.black,
                                Global.subStringFormat(text: upcomingController.matchListPojo.value.data![index].matchTitle!),
                                1,CommonWidget.getInstance().widthFactor(context)*0.02,FontStyle.normal,1,FontWeight.w900,),

                              SizedBox(
                                height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                              ),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.darkGray,"starting from "+getStartDate(upcomingController.matchListPojo.value.data![index].matchSchedule!),1,
                                  CommonWidget.getInstance().widthFactor(context)*0.023,FontStyle.normal,0,FontWeight.w600,fontfamily: false),
                              SizedBox(height: CommonWidget.getInstance().widthFactor(context) * 0.01),
                              /*Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: CommonColors.primaryColor1,
                                ),
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(left:6,right:6,top:2.5,bottom:3),
                                  child: CommonWidget.getInstance().normalText(
                                      CommonColors.white,getStartDate(upcomingController.matchListPojo.value.data![index].endDate!),1,CommonWidget.getInstance().widthFactor(context)*0.015,FontStyle.normal,0,FontWeight.w400),
                                ),
                              ),*/
                            ],
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
        Get.toNamed('/practiceMatch');

        break;
    }
  }

  DateFormat dateFormat = DateFormat("dd MMM");


  String getStartDate(var date) {
    var mDate1= DateTime.parse(date);
    return dateFormat.format(mDate1);

  }
}

