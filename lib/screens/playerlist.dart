import 'dart:convert';

import 'package:axe/controller/player_controller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/common_arguments.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerList extends StatelessWidget implements CallBackInterface {
  TextEditingController searchController = TextEditingController();

  PlayerList({Key? key}) : super(key: key);

 void filterSearchResults(String searchText) {
   final PlayerController controller = Get.find();
   controller.playerpojo.value.data!.clear();

   if (searchText.isEmpty) {
     controller.playerpojo.value.data!.addAll(controller.playerpojoDuplicate.value.data!);
     controller.playerpojo.refresh();
     return;
   }

   controller.playerpojoDuplicate.value.data!.forEach((item) {
     if (item.firstName!.toLowerCase().contains(searchText) ||item.lastName!.toLowerCase().contains(searchText) ) {
       controller.playerpojo.value.data!.add(item);
       controller.playerpojo.refresh();
       return;
     }
   });

   return;

 }

 var playerid1="";
 List<String> player1List=[];
 List<String> player2List=[];

 @override
  Widget build(BuildContext context) {
  final PlayerController controller = Get.find();
  return SafeArea(
      child: Scaffold(
        body:   SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: (){
                    Get.back();
                }, icon: const Icon(Icons.arrow_back_rounded)),

                 Card(
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(width: 2, color: CommonColors.white)),

                  child: TextField(
                    controller: searchController,
                    onChanged: (value){
                      filterSearchResults(value.toLowerCase());
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search Player here...',
                      filled: true,
                      fillColor:CommonColors.white,
                      prefixIcon: Icon(Icons.search, color: CommonColors.darkGray),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.04,
                ),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.02,right:CommonWidget.getInstance().widthFactor(context) * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.player,0,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,2,FontWeight.w600),

                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.invite,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                    ],
                  ),
                ),

                 Padding(
                   padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.02,right:CommonWidget.getInstance().widthFactor(context) * 0.02),
                   child: const Divider(
                     height: 20,
                     thickness: 1,
                     color: CommonColors.grayColor,
                   ),
                 ),

            Obx(()=> controller.playerpojo.value.data==null?const CircularProgressIndicator():
                ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  controller.playerpojo.value.data!.length,
                    separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
                    itemBuilder: (context, index) {return ListTile(
                        leading: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                           /* Get.toNamed( ()=>OtherUserProfile(controller.playerpojo.value.data![index].firstName!+" "+controller.playerpojo.value.data![index].lastName!,
                                controller.playerpojo.value.data![index].bigaxeScore,
                                controller.playerpojo.value.data![index].hatchetsScore,
                                controller.playerpojo.value.data![index].teamplayScore,
                                controller.playerpojo.value.data![index].picture,
                                controller.playerpojo.value.data![index].phone,
                                controller.playerpojo.value.data![index].email,
                                controller.playerpojo.value.data![index].city,
                                controller.playerpojo.value.data![index].state,
                                controller.playerpojo.value.data![index].address,

                            ));*/

                          },
                          child: Container(
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
                              child:   Padding(
                                  padding:const EdgeInsets.all(1),
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:controller.playerpojo.value.data![index].picture==null?
                                        const AssetImage("assets/images/dummypic.jpg") as ImageProvider:
                                        NetworkImage(Constant.imageUrl+controller.playerpojo.value.data![index].picture!),
                                  )
                              ),
                            ),
                          ),
                        ),

                        title: CommonWidget.getInstance().normalText(
                            CommonColors.black,controller.playerpojo.value.data![index].firstName!,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                        subtitle:  CommonWidget.getInstance().normalText(
                            CommonColors.darkGray,"Location:"+controller.playerpojo.value.data![index].city.toString()+", "+controller.playerpojo.value.data![index].state.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w600),

                        trailing: Visibility(
                          visible: !(Get.arguments==null),
                          child: IconButton(
                            onPressed: ()  async {

                              controller.playerpojo.value.data![index].invitation= controller.playerpojo.value.data![index].invitation==1?0:1;

                              if(Get.arguments[0][CommonArguments.argPlayerType]==1){ //for player 1
                                if(Get.arguments[0][CommonArguments.argNavigationType]=="change_player"){
                                  Map jsonBody = {
                                    "match_id":Get.arguments[0][CommonArguments.argMatchId].toString(),
                                    "players1_ids":controller.playerpojo.value.data![index].id.toString(),
                                    "players2_ids":""// This is empty because request sent to Player 1
                                  };
                                  Global.postData(context, Constant.inviteByVenue, Constant.inviteByVenue, jsonBody, this);
                                  // Global.popUpAlert(context: context, callBackInterface: this,
                                  //     acceptButtonText: Strings.sendInvite, cancelButtonText: Strings.cancelInvite,
                                  //     title: Strings.inviteApproval,value: jsonEncode(jsonBody));
                                }else{
                                  if(controller.playerpojo.value.data![index].invitation==1){
                                    player1List.add(controller.playerpojo.value.data![index].id.toString());
                                    controller.updatePlayer1IList(controller.playerpojo.value.data![index].firstName.toString());
                                    controller.updatePlayer1Id(player1List.join(","));
                                  }else{
                                    player1List.remove(controller.playerpojo.value.data![index].id.toString());
                                    controller.player1List.remove(controller.playerpojo.value.data![index].firstName.toString());
                                    controller.updatePlayer1Id(player1List.join(","));
                                  }
                                }
                                controller.playerpojo.refresh();
                              }else{ //for player 2
                                if(Get.arguments[0][CommonArguments.argNavigationType]=="change_player"){
                                  Map jsonBody = {
                                    "match_id":"4",
                                    "players1_ids":"",
                                    "players2_ids":controller.playerpojo.value.data![index].id.toString()
                                  };
                                  Global.postData(context, Constant.inviteByVenue, Constant.inviteByVenue, jsonBody, this);
                                }else{
                                  if(controller.playerpojo.value.data![index].invitation==1){
                                    player2List.add(controller.playerpojo.value.data![index].id.toString());
                                    controller.updatePlayer2List(controller.playerpojo.value.data![index].firstName.toString());
                                    controller.updatePlayer2Id(player2List.join(","));
                                  }else{
                                    player2List.remove(controller.playerpojo.value.data![index].id.toString());
                                    controller.player2List.remove(controller.playerpojo.value.data![index].firstName.toString());
                                    controller.updatePlayer2Id(player2List.join(","));
                                  }
                                }
                                controller.playerpojo.refresh();
                              }

                            },

                            icon: controller.playerpojo.value.data![index].invitation==0?
                            Image.asset("assets/images/smiley.png",color:CommonColors.red,):
                            Image.asset("assets/images/smiley.png",color: CommonColors.green,)
                          ),
                        )
                      );
                    })),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),

            /*    Row(
                  children: [

                    CommonWidget.getInstance().normalText(
                        CommonColors.primaryColor1, Strings.show_all,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w500),
                    SizedBox(
                      width: CommonWidget.getInstance().heightFactor(context) * 0.01,
                    ),
                    Icon(Icons.arrow_forward_outlined,color: CommonColors.primaryColor1,)

                  ],
                ),*/

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),
                Row(
                  children: [
                    Image.asset("assets/images/exclaim.png"),

                    SizedBox(
                      width: CommonWidget.getInstance().heightFactor(context) * 0.01,
                    ),

                    CommonWidget.getInstance().normalText(
                        CommonColors.darkGray, Strings.member_not_in_list,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w400),
                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),
                const Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(width: 2, color: CommonColors.white)),

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'xx@gmail.com',
                      filled: true,
                      fillColor:CommonColors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),
                Row(

                  children: [
                    CommonWidget.getInstance().flexibleButtonWithIcon(
                        context,
                        Strings.invite,
                        CommonWidget.getInstance().widthFactor(context)*0.4,
                        CommonWidget.getInstance().widthFactor(context)*0.14,
                        CommonColors.primaryColor1,
                        CommonColors.primaryColor1,
                        CommonColors.white,
                        this,
                        "logout",
                        CommonColors.white),

                    SizedBox(
                      width: CommonWidget.getInstance().heightFactor(context) * 0.02,
                    ),

                    SizedBox(
                      height:  CommonWidget.getInstance().widthFactor(context)*0.14,
                      width: CommonWidget.getInstance().widthFactor(context)*0.4,
                      child: ElevatedButton(
                          style:ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: const BorderSide(color: CommonColors.black)

                              )),

                          onPressed: () {
                          },

                          child: Text(Strings.cancel,
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                  color: CommonColors.darkGray,
                                  fontFamily: "Lato",
                                  fontSize:  CommonWidget.getInstance().widthFactor(context) * 0.04,
                                  fontWeight: FontWeight.bold))),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
    );

 }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
   switch(title){
     case Strings.sendInvite:
       break;
   }
  }
}
