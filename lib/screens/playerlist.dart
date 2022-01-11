import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/other_user_profile.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PlayerList extends StatelessWidget implements CallBackInterface {
 const PlayerList({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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

                const Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(width: 2, color: CommonColors.white)),

                  child: TextField(
                    decoration: InputDecoration(
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
                ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  7,
                    separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Get.to( ()=>OtherUserProfile());

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
                              child:  const Padding(
                                  padding:EdgeInsets.all(1),
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                  )
                              ),
                            ),
                          ),
                        ),

                        title: CommonWidget.getInstance().normalText(
                            CommonColors.black,"David",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                        subtitle:  CommonWidget.getInstance().normalText(
                            CommonColors.darkGray,"Location: Southfield",0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w600),

                        trailing: IconButton(
                          onPressed: (){

                          },
                          icon: Image.asset("assets/images/smiley.png"),
                        )

                      );
                    }),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),


                Row(
                  children: [

                    CommonWidget.getInstance().normalText(
                        CommonColors.primaryColor1, Strings.show_all,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w500),
                    SizedBox(
                      width: CommonWidget.getInstance().heightFactor(context) * 0.01,
                    ),
                    Icon(Icons.arrow_forward_outlined,color: CommonColors.primaryColor1,)

                  ],
                ),

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
                Card(
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
                                  side: BorderSide(color: CommonColors.black)

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
        ),
      ),
    );  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    // TODO: implement widgetCallBack
  }
}
