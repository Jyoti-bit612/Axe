import 'dart:math';

import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/screens/change_password.dart';
import 'package:axe/screens/venueSide/create_league.dart';
import 'package:axe/screens/venueSide/create_match.dart';
import 'package:axe/screens/edit_score.dart';
import 'package:axe/screens/login.dart';
import 'package:axe/screens/playerSide/new_invitation.dart';
import 'package:axe/screens/notification.dart';
import 'package:axe/screens/playerlist.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OtherUserProfile extends StatelessWidget  implements CallBackInterface{

  var name;
  var bigaxeScore;
  var hatchetsScore;
  var teamplayScore;
  var picture;
  var phone;
  var email;
  var city;
  var state;
  var address;

  OtherUserProfile( this.name,
      this.bigaxeScore,
      this.hatchetsScore,
      this.teamplayScore,
      this.picture,
      this.phone,
      this.email,
      this.city,
      this.state,
      this.address);

  var myMenuItems = <String>[
    Strings.privacy_profile,
    Strings.help_center,
    Strings.report,
    Strings.logout,
  ];

  void onSelect(item) {
    switch (item) {
      case Strings.privacy_profile:
        print('Home clicked');
        break;
      case Strings.help_center:
        print('Profile clicked');
        break;
      case Strings.report:
        print('Setting clicked');
        break;

      case Strings.logout:
        print('Setting clicked');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: CommonColors.white,
            title: const Text(""),

            leading:  IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_rounded,color: CommonColors.black,)),


            actions: <Widget>[

              PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz,color: CommonColors.black),
                  onSelected: onSelect,
                  itemBuilder: (BuildContext context) {
                    return myMenuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  })
            ],
          ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: CommonWidget.getInstance().widthFactor(context) * 0.30,
                    height: CommonWidget.getInstance().widthFactor(context) * 0.30,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: picture== null ?CircleAvatar(
                            backgroundColor: CommonColors.textfiled_gray,
                            child: Image.asset("assets/images/camera.png")

                        ):CircleAvatar(
                          backgroundColor: CommonColors.textfiled_gray,
                          backgroundImage:
                          NetworkImage(Constant.imageUrl+picture),
                        )
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.black, name,0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,2,FontWeight.w600,fontfamily: true),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),
                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.primaryColor1, email,1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.black, "Ph: "+phone.toString(),1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.darkGray, city.toString()+", "+state.toString(),1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.07,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, "Big Axe",1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, bigaxeScore.toString(),1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),

                      Container(
                        color: CommonColors.grayColor,
                        width: 1,
                        height: CommonWidget.getInstance().widthFactor(context)*0.2,

                      ),

                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, "Hatchets",1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, hatchetsScore.toString(),1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),
                      Container(
                        color: CommonColors.grayColor,
                        width: 1,
                        height: CommonWidget.getInstance().widthFactor(context)*0.2,

                      ),
                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, "Teamplay",1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, teamplayScore.toString(),1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),
                    ]
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.15,
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: CommonWidget.getInstance().flexibleButton(
                      context,
                      Strings.edit_scrore,
                      CommonWidget.getInstance().widthFactor(context) * 0.6,
                      CommonWidget.getInstance().widthFactor(context) * 0.13,
                      CommonColors.primaryColor1,
                      CommonColors.primaryColor1,
                      CommonColors.white,
                      this,
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

          ]),
        ),

    )));
  }

  addressPasswordWidget(String title,BuildContext context, IconData icon, bool isOn, String type){
    return GestureDetector(
      onTap: (){
        switch(type){

          case "password":
            Get.toNamed('/changePassword');
            break;

          case "address":

            break;
        }
      },

      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.01,
          ),
          Icon(icon,color: CommonColors.primaryColor1,),

          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.045),
              child: Text(
              title
              ),
            ),
          ),

          Visibility(
              visible: isOn,
              child: type=="password"?
              Icon(Icons.loop,color: CommonColors.darkGray,):
              Icon(Icons.edit,color: CommonColors.darkGray,)),

          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
          ),

        ],
      ),
    );

  }


  editTextWidget(String title,BuildContext context, IconData icon, bool isOn, String type){
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width:  CommonWidget.getInstance().widthFactor(context) * 0.01,
        ),
        Icon(icon,color: CommonColors.primaryColor1,),

        SizedBox(
          width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
        ),

        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: title,
              filled: true,
              fillColor:CommonColors.white,
              border: InputBorder.none,
            ),
          ),
        ),

        Visibility(
            visible: isOn,
            child: type=="password"?
           Icon(Icons.loop,color: CommonColors.darkGray,):
            Icon(Icons.edit,color: CommonColors.darkGray,)),

        SizedBox(
          width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
        ),

      ],
    );

  }

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    switch(title){
      case Strings.edit_scrore:
        Get.toNamed('/editScore');

        break;

    }
  }

}
