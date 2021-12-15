import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';

class PreviousLeagueDetail extends StatefulWidget {
  const PreviousLeagueDetail({Key? key}) : super(key: key);

  @override
  _PreviousState createState() => _PreviousState();
}

List list = [
  {"name": "Season1"},
  {"name": "Season2"},
];

List list1 = [
  {"name": "Low to High"},
  {"name": "High to Low"},
];


class _PreviousState extends State<PreviousLeagueDetail> implements CallBackInterface {
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

                IconButton(onPressed: (){
                  Navigator.pop(context);
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
                  height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                ),

                Row(
                  children: [
                    Expanded(
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.top_player,0,CommonWidget.getInstance().widthFactor(context)*0.055,FontStyle.normal,2,FontWeight.w600),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right:6.0),
                      child: Container(
                        height:CommonWidget.getInstance().widthFactor(context) * 0.06 ,
                        width: CommonWidget.getInstance().widthFactor(context) * 0.06,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CommonColors.primaryColor1
                        ),
                        child: Icon(Icons.arrow_back_rounded,color: CommonColors.white,size: CommonWidget.getInstance().widthFactor(context) * 0.03,),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left:6.0),
                      child: Container(
                        height:CommonWidget.getInstance().widthFactor(context) * 0.06 ,
                        width: CommonWidget.getInstance().widthFactor(context) * 0.06,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CommonColors.primaryColor1

                        ),
                        child: Icon(Icons.arrow_forward,color: CommonColors.white,size:CommonWidget.getInstance().widthFactor(context) * 0.03,),
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.22,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:  4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right:16.0),
                          child: Container(
                            color: CommonColors.primaryColor2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right:20),
                                  child: Row(
                                    children: [
                                      scoreWidget("08","Rank"),

                                      Divider(height:1,thickness:1,color: CommonColors.white,),

                                      scoreWidget("RYAN SMITH","Location Virgenua Beach VA"),

                                    ],
                                  ),
                                ),

                                Divider(height:10,thickness:1,color: CommonColors.white,),

                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right:20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      scoreWidget("70%","Accuracy"),
                                      scoreWidget("07","Leagues"),
                                      scoreWidget("18","Matches"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.player,0,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,2,FontWeight.w600),

                Padding(
                  padding: const EdgeInsets.only(top:2.5,left:2),
                  child: Container(
                    height: 1,
                    width:  CommonWidget.getInstance().widthFactor(context) * 0.2,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Row(
                  children: [
                    CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.sort_by,0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,2,FontWeight.w600),

                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Row(
                           children: [
                             Expanded(
                               child: Card(
                                 elevation: 4,
                                 child: SizedBox(
                                     height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                                     // width: CommonWidget.getInstance().widthFactor(context) * 0.09,
                                     child: DropDownClass(
                                         CommonColors.white,
                                         "commonDropdown",
                                         list[0]["name"],
                                         list,
                                         this,
                                         "0",true, true)),
                               ),
                             ),

                             SizedBox(
                               width: CommonWidget.getInstance().widthFactor(context) * 0.02,
                             ),

                             Expanded(
                               child: Card(
                                 elevation: 4,
                                 child: SizedBox(
                                     height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                                     //  width: CommonWidget.getInstance().widthFactor(context) * 0.09,
                                     child: DropDownClass(
                                         CommonColors.white,
                                         "commonDropdown",
                                         list[0]["name"],
                                         list,
                                         this,
                                         "0",
                                         true,
                                         true)),
                               ),
                             ),
                           ],
                         ),

                         Card(
                           elevation: 4,
                           child: SizedBox(
                               height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                              // width: CommonWidget.getInstance().widthFactor(context) * 0.45,
                               child: DropDownClass(
                                   CommonColors.white,
                                   "commonDropdown",
                                   list1[0]["name"],
                                   list1,
                                   this,
                                   "0",
                                   true,
                                   true)),
                         ),
                       ],
                     ),
                   ),

                  ],
                ),


                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),

                Padding(
                  padding: const EdgeInsets.only(left:4.0,right:0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width:CommonWidget.getInstance().widthFactor(context) * 0.49,
                        child: CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.avatar,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600),
                      ),

                      SizedBox(
                        height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                      ),

                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.pt,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.ba,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.htc,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                      CommonWidget.getInstance().normalText(
                          CommonColors.black, Strings.tp,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left:4.0,right:4),
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
                        padding: const EdgeInsets.only(top:8.0,bottom: 8),
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:CommonWidget.getInstance().widthFactor(context) * 0.5,
                                child: Row(
                                  children: [
                                    Container(
                                      width:  CommonWidget.getInstance().widthFactor(context) * 0.13,
                                      height:  CommonWidget.getInstance().widthFactor(context) * 0.13,
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
                                    SizedBox(
                                      width: CommonWidget.getInstance().heightFactor(context) * 0.01,
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonWidget.getInstance().normalText(
                                            CommonColors.black,"David",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600,fontfamily: false),


                                         CommonWidget.getInstance().normalText(
                                            CommonColors.darkGray,"Location: Southfield",0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w400),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.primaryColor1,"2.8",0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,2,FontWeight.w600),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.primaryColor1,"17",0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,2,FontWeight.w600),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.primaryColor1,"12",0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,2,FontWeight.w600),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.primaryColor1,"8",0,CommonWidget.getInstance().widthFactor(context)*0.026,FontStyle.normal,2,FontWeight.w600)


                            ],
                        ),
                      );
                    }),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  scoreWidget(String title, String subTitle) {
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
    // TODO: implement widgetCallBack
  }
}

