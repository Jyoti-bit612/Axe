import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/change_password.dart';
import 'package:axe/screens/create_league.dart';
import 'package:axe/screens/create_match.dart';
import 'package:axe/screens/edit_score.dart';
import 'package:axe/screens/login.dart';
import 'package:axe/screens/new_invitation.dart';
import 'package:axe/screens/notification.dart';
import 'package:axe/screens/playerlist.dart';
import 'package:axe/screens/practice_match.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget  implements CallBackInterface{
  UserProfile({Key? key}) : super(key: key);

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
        Get.defaultDialog(
            title:  "Do yo want to logout?",
            barrierDismissible: true,
            middleText: "",
            actions: [
              TextButton(
                //Click on no to reset/go to previous state
                onPressed: () {
                  Get.back();
                },
                child: const Text('No'),
              ),
              TextButton(
                //Click on yes to perform operation according to use
                onPressed: () {
                  Global.logOut(endUrl: Constant.playerLogout);
                },
                child: const Text('Yes'),
              ),
            ]
        );
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

            actions: <Widget>[
              IconButton(
                  onPressed: (){
                    Get.toNamed('/notificationClass');

                  },
                  icon: const Icon(Icons.notifications,color: CommonColors.black,)
              ),

              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert_rounded,color: CommonColors.black),
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

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),

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
                      child: DecoratedBox(
                          decoration:  const BoxDecoration(
                            color: CommonColors.textfiled_gray,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/images/camera.png")),
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.black, "John D. McHenry",0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w400),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),
                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.darkGray, "Spending some budget in the axe tournaments. event coordinator Texas",1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, "Big Axe",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, "72",1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
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
                              CommonColors.black, "Hatchets",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, "18",1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
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
                              CommonColors.black, "Teamplay",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, "23",1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
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
                              CommonColors.black, "P. Score",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, "36",1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),

                    ]
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/newInvitaton');


                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.12,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Center(
                                child: CommonWidget.getInstance().normalText(
                                        CommonColors.white, Strings.invitaion,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/editScore');

                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.22,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.12,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Center(
                                child: CommonWidget.getInstance().normalText(
                                        CommonColors.white, Strings.score,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                              ),

                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/practiceMatch');
                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.35,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.12,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Center(
                                child: CommonWidget.getInstance().normalText(
                                        CommonColors.white, Strings.practice_match,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                              ),

                            )),
                      )
                    ]
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.personal_info,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w400),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                editTextWidget("john D. Henry",context,Icons.person,true,"name"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget("xx@gmail.com",context,Icons.email_outlined,false,"email"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget("+915263254563",context,Icons.phonelink_ring_outlined,true,"phone"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                addressPasswordWidget("password",context,Icons.remove_red_eye_outlined,true,"password"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                addressPasswordWidget("91 Heritage Lawn",context,Icons.location_on,true,"address"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
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


    }
  }

}
