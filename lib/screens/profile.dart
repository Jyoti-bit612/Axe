import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/create_league.dart';
import 'package:axe/screens/create_match.dart';
import 'package:axe/screens/login.dart';
import 'package:axe/screens/playerlist.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  implements CallBackInterface{

  @override
  void initState() {
    super.initState();
  }

  List list = [
    {"name": "user1"},
    {"name": "user2"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    const Icon(Icons.notifications),

                    SizedBox(
                      width: CommonWidget.getInstance().heightFactor(context) * 0.03,
                    ),

                    Icon(Icons.more_horiz_outlined)

                  ],
                ),

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
                      CommonColors.black, "John D. McHenry",0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w400),
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
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateLeague()));

                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.25,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset("assets/images/create_league.png",width: CommonWidget.getInstance().widthFactor(context) * 0.09,),

                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.white, Strings.create_league,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),

                                ],
                              ) ,
                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateMatch()));

                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.25,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset("assets/images/create_match2.png",width: CommonWidget.getInstance().widthFactor(context) * 0.09,),

                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.white, Strings.create_match,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                                ],
                              ) ,
                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerList()));

                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.25,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset("assets/images/playerprofile.png",width: CommonWidget.getInstance().widthFactor(context) * 0.09,),
                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.white, Strings.player,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                                ],
                              ) ,
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

                editTextWidget("password",context,Icons.remove_red_eye_outlined,true,"password"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget("91 Heritage Lawn",context,Icons.location_on,true,"address"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.06,
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: CommonWidget.getInstance().flexibleButton(
                      context,
                      Strings.player_request,
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
      case Strings.sign_up:
      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
        break;

    }
  }

}
