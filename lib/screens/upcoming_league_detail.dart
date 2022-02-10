import 'package:axe/controller/home_controller.dart';
import 'package:axe/controller/upcoming_league_controller.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
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
    final UpcomingLeagueController controller = Get.find();

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
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_rounded)),

                Center(
                  child:controller.upcomingLeaguePojo.value.leaguedata==null?
                  Image.asset("assets/images/champion.png",
                    width:CommonWidget.getInstance().widthFactor(context) * 0.5,
                    height: CommonWidget.getInstance().widthFactor(context) * 0.5,):
                  controller.upcomingLeaguePojo.value.leaguedata!.logoPath==null?
                  Image.asset("assets/images/champion.png",
                    width:CommonWidget.getInstance().widthFactor(context) * 0.5,
                    height: CommonWidget.getInstance().widthFactor(context) * 0.5,):
                  Image.network(Constant.imageUrl+controller.upcomingLeaguePojo.value.leaguedata!.logoPath!,width:CommonWidget.getInstance().widthFactor(context) * 0.5,
                    height: CommonWidget.getInstance().widthFactor(context) * 0.5,),
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.black,
                      controller.upcomingLeaguePojo.value.leaguedata==null?"":
                      controller.upcomingLeaguePojo.value.leaguedata!.leagueTitle!,1,CommonWidget.getInstance().widthFactor(context)*0.052,FontStyle.normal,2,FontWeight.w600),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.04,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.darkGray,
                      controller.upcomingLeaguePojo.value.leaguedata==null?"":
                      controller.upcomingLeaguePojo.value.leaguedata!.description!,1,
                      CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w400),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                ),


                Visibility(
                  visible: Global.loginType == "1" ? true : false,
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
                  height: CommonWidget.getInstance().heightFactor(context) *
                      0.03,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black,
                    Strings.player,
                    0,
                    CommonWidget.getInstance().widthFactor(context) * 0.052,
                    FontStyle.normal,
                    2,
                    FontWeight.w600),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) *
                      0.03,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonWidget.getInstance().normalText(
                          CommonColors.black,
                          Strings.avatar,
                          0,
                          CommonWidget.getInstance().widthFactor(context) *
                              0.035,
                          FontStyle.normal,
                          2,
                          FontWeight.w600),

                      CommonWidget.getInstance().normalText(
                          CommonColors.black,
                          Strings.status,
                          0,
                          CommonWidget.getInstance().widthFactor(context) *
                              0.03,
                          FontStyle.normal,
                          1,
                          FontWeight.w600),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8),
                  child: Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.upcomingLeaguePojo.value.players!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Get.toNamed('/otherUserProfile');

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ListTile(
                            leading: Container(
                              width: CommonWidget.getInstance().widthFactor(
                                  context) * 0.15,
                              height: CommonWidget.getInstance().widthFactor(
                                  context) * 0.15,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  CommonColors.primaryColor1,
                                  CommonColors.imageRed
                                ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                ),
                                shape: BoxShape.circle,

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                      color: CommonColors.textfiled_gray,
                                      shape: BoxShape.circle,
                                    ),
                                    child:

                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:controller.upcomingLeaguePojo.value.players![index].picture==null?
                                      const AssetImage("assets/images/profile.png") as ImageProvider:
                                      NetworkImage(Constant.imageUrl+controller.upcomingLeaguePojo.value.players![index].picture!),
                                    ),
                              ),
                            )),

                            title: CommonWidget.getInstance().normalText(
                                CommonColors.black,
                                controller.upcomingLeaguePojo.value.players![index].firstName.toString(),
                                0,
                                CommonWidget.getInstance().widthFactor(
                                    context) * 0.03,
                                FontStyle.normal,
                                1,
                                FontWeight.w900,
                                fontfamily: false),

                            subtitle: CommonWidget.getInstance().normalText(
                                CommonColors.darkGray,
                                "Location: "+ controller.upcomingLeaguePojo.value.players![index].city.toString(),
                                0,
                                CommonWidget.getInstance().widthFactor(
                                    context) * 0.028,
                                FontStyle.normal,
                                1,
                                FontWeight.w600),


                            trailing: CommonWidget.getInstance().normalText(
                                CommonColors.red,
                                controller.upcomingLeaguePojo.value.players![index].invited=="1"?Strings.accepted:Strings.pending,
                                0,
                                CommonWidget.getInstance().widthFactor(
                                    context) * 0.026,
                                FontStyle.normal,
                                2,
                                FontWeight.w600),

                          ),
                          //   ),
                        ),
                      );
                    }),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) *
                      0.03,
                ),

                Visibility(
                  visible: Global.loginType == "1" ? false : true,
                  child: CommonWidget.getInstance().flexibleButtonWithIcon(
                      context,
                      Strings.invite_player,
                      CommonWidget.getInstance().widthFactor(context) * 0.5,
                      CommonWidget.getInstance().widthFactor(context) * 0.14,
                      CommonColors.primaryColor1,
                      CommonColors.primaryColor1,
                      CommonColors.white,
                      this,
                      "",
                      CommonColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    switch (title) {
      case Strings.invite_player:
        Get.toNamed('/playerlist');

        break;

  }
  }

}

