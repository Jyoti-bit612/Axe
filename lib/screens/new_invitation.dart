import 'dart:convert';

import 'package:axe/controller/invitationcontroller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewInvitaton extends StatefulWidget {
  const NewInvitaton({Key? key}) : super(key: key);

  @override
  NewInvitatonState createState() => NewInvitatonState();
}

class NewInvitatonState extends State<NewInvitaton> with SingleTickerProviderStateMixin implements CallBackInterface  {

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
        body: Obx(()=>SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
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


                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.new_invitation,0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,2,FontWeight.w600),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                upperView(1,""),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),


                TabBar(
                  labelColor: CommonColors.black,
                  unselectedLabelColor: CommonColors.black,
                  controller: _tabController,
                  indicatorPadding: EdgeInsets.only(top:43),
                  indicatorWeight: 0.1,
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
                      text:Strings.accepted,),

                    Tab(
                      text:Strings.rejected ,
                    ),
                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

               SizedBox(
                 height: CommonWidget.getInstance().heightFactor(context) * 0.6,
                 child: TabBarView(
                   controller: _tabController,
                   children: <Widget>[
                     upperView(2,Strings.accepted),
                     upperView(3,Strings.rejected),
                   ],
                 ),
               ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  upperView(int type,String text) {//type 1 is for new invitations
    final InvitationController invitationController = Get.find();
    return invitationController.playerInvitationPojo.value.invitationData==null?const Center(child: CircularProgressIndicator()):ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount:  invitationController.playerInvitationPojo.value.invitationData!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Padding(
                padding:EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.04),
                child: Row(
                  children: [
                    Container(
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
                        padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.005),
                        child:  const Padding(
                            padding:EdgeInsets.all(1),
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width: CommonWidget.getInstance().widthFactor(context) * 0.03,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidget.getInstance().normalText(CommonColors.black,
                                invitationController.playerInvitationPojo.value.invitationData![index].leagueDetails!.leagueTitle!.toUpperCase(),
                                0,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w800,fontfamily: true),
                            CommonWidget.getInstance().normalText(CommonColors.black.withOpacity(0.8),
                                "Match: "+invitationController.playerInvitationPojo.value.invitationData![index].matchTitle!.toUpperCase(),
                                0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w600,fontfamily: false),
                            SizedBox(
                              height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                            ),
                            CommonWidget.getInstance().normalText(CommonColors.darkGray,
                                "Location: "+ invitationController.playerInvitationPojo.value.invitationData![index].leagueDetails!.city!,
                                0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                            SizedBox(
                              height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                            ),

                            CommonWidget.getInstance().normalText(
                                CommonColors.grayColor,text,0,CommonWidget.getInstance().widthFactor(context)*0.022,FontStyle.normal,1,FontWeight.w600),
                          ]),
                    ),

                    Visibility(
                      visible: type==1?true:false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: CommonColors.imageRed,),
                              shape: const CircleBorder(),
                              padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context)*0.02),
                            ),
                            child: const Icon(Icons.clear_outlined,color:CommonColors.imageRed),
                            onPressed: () {},
                          ),

                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: CommonColors.green,),
                              shape: const CircleBorder(),
                              padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context)*0.02),
                            ),
                            child: const Icon(Icons.check,color:CommonColors.green),
                            onPressed: () {
                              Global.popUpAlert(context: context, callBackInterface: this, acceptButtonText: Strings.accept,
                                  cancelButtonText: Strings.cancel, title: Strings.acceptInvitation,
                                  value: invitationController.playerInvitationPojo.value.invitationData![index].id.toString());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    switch(title){
      case Strings.accept:
      Navigator.pop(context);
      Global.showLoaderDialog(context);
        Map jsonBody = {
          "match_id": value
        };
        Global.postData(context,Constant.playerAcceptInvite,Constant.playerAcceptInvite,jsonBody,this);
        break;
      case Constant.playerAcceptInvite:
        Get.back();
        var data = jsonDecode(value);
        print(data["message"]);
        Global.showSnackBar(context, data["message"]);
        break;
    }

  }


}
