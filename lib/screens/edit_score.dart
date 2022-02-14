import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScore extends StatelessWidget implements CallBackInterface {
   EditScore({Key? key}) : super(key: key);

  final list = [
    {"name": "Season1"},
    {"name": "Season2"},
  ];

   final list1 = [
    {"name": "League1"},
    {"name": "League2"},
  ];

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
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.04,
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: (){
                                Get.back();
                              }, icon: const Icon(Icons.arrow_back_rounded)),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Container(
                                width:  CommonWidget.getInstance().widthFactor(context) * 0.35,
                                height:  CommonWidget.getInstance().widthFactor(context) * 0.5,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  ),
                                  shape: BoxShape.rectangle,

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: DecoratedBox(
                                      decoration:  const BoxDecoration(
                                        color: CommonColors.textfiled_gray,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Image.asset("assets/images/profile.png")),
                                ),
                              ),

                              SizedBox(
                                width: CommonWidget.getInstance().widthFactor(context) * 0.04,
                              ),

                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right:CommonWidget.getInstance().widthFactor(context) * 0.04),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      CommonWidget.getInstance().normalText(
                                          CommonColors.black, "John Bradley",0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,2,FontWeight.w600,fontfamily: true),

                                      SizedBox(
                                        height: CommonWidget.getInstance().widthFactor(context) * 0.04,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CommonWidget.getInstance().normalText(
                                              CommonColors.black, Strings.match_played,1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),

                                          CommonWidget.getInstance().normalText(
                                              CommonColors.primaryColor1, "277",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true)

                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:6.0,bottom: 6,),
                                        child: Container(
                                          height: 1,
                                          width: double.infinity,
                                          color: CommonColors.lightgrayColor,
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CommonWidget.getInstance().normalText(
                                              CommonColors.black, Strings.won,1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),

                                          CommonWidget.getInstance().normalText(
                                              CommonColors.primaryColor1, "277",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true)

                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:6.0,bottom: 6,),
                                        child: Container(
                                          height: 1,
                                          width: double.infinity,
                                          color: CommonColors.lightgrayColor,
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CommonWidget.getInstance().normalText(
                                              CommonColors.black, Strings.loss,1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),

                                          CommonWidget.getInstance().normalText(
                                              CommonColors.primaryColor1, "277",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true)

                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:6.0,bottom: 6,),
                                        child: Container(
                                          height: 1,
                                          width: double.infinity,
                                          color: CommonColors.lightgrayColor,
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CommonWidget.getInstance().normalText(
                                              CommonColors.black, Strings.overall_point,1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),

                                          CommonWidget.getInstance().normalText(
                                              CommonColors.primaryColor1, "277",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true)

                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:6.0,bottom: 6,),
                                        child: Container(
                                          height: 1,
                                          width: double.infinity,
                                          color: CommonColors.lightgrayColor,
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.05,
                          ),

                          Row(
                            children: [

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black, Strings.hatchet,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600,fontfamily: true),

                              SizedBox(
                                width: CommonWidget.getInstance().widthFactor(context) * 0.05,
                              ),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black, Strings.big_axe,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600,fontfamily: true),
                              SizedBox(
                                width: CommonWidget.getInstance().widthFactor(context) * 0.05,
                              ),

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black, Strings.team_play,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600,fontfamily: true),

                            ],
                          ),

                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),

                Row(
                  children: [

                    SizedBox(
                      width: CommonWidget.getInstance().widthFactor(context) * 0.01,
                    ),

                    Container(
                        height: 2,
                        width:  CommonWidget.getInstance().widthFactor(context) * 0.22,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CommonColors.primaryColor1,
                                CommonColors.imageRed,
                              ],
                            ))),
                    SizedBox(
                      width: CommonWidget.getInstance().widthFactor(context) * 0.05,
                    ),
                    Container(
                        height: 2,
                        width:  CommonWidget.getInstance().widthFactor(context) * 0.20,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CommonColors.primaryColor1,
                                CommonColors.imageRed,
                              ],
                            ))),

                    SizedBox(
                      width: CommonWidget.getInstance().widthFactor(context) * 0.06,
                    ),

                    Container(
                        height: 2,
                        width:  CommonWidget.getInstance().widthFactor(context) * 0.24,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CommonColors.primaryColor1,
                                CommonColors.imageRed,
                              ],
                            ))),

                  ],
                ),

                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.04,
                          ),

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

                              SizedBox(
                                width: CommonWidget.getInstance().widthFactor(context) * 0.02,
                              ),

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
                            ],
                          ),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                          ),

                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                              itemCount:  6,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CommonWidget.getInstance().normalText(
                                              CommonColors.black, "Match"+{index+1}.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600),

                                          Visibility(
                                              visible: Global.loginType=="2"?false:true,
                                              child: const Icon(Icons.edit,color: CommonColors.primaryColor1,))

                                        ],
                                      ),

                                      SizedBox(
                                        height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                                      ),

                                      SizedBox(
                                        height: CommonWidget.getInstance().widthFactor(context)*0.24,
                                        child: Card(
                                          elevation: 4,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:  12,
                                              itemBuilder: (context1,index1){
                                                return  Table(
                                                  defaultColumnWidth: index1==0?
                                                  FixedColumnWidth(CommonWidget.getInstance().widthFactor(context)*0.25):
                                                  FixedColumnWidth(CommonWidget.getInstance().widthFactor(context)*0.14),

                                                  border: TableBorder.all(
                                                      color: CommonColors.lightgrayColor,
                                                      style: BorderStyle.solid,
                                                      width: 1),

                                                  children: [
                                                    TableRow(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                                            child: CommonWidget.getInstance().normalText(
                                                               CommonColors.darkGray,
                                                                index1==0?"Throw":index1==11?"T.P":index1.toString(),
                                                                1,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,2,FontWeight.w200),
                                                          ),
                                                        ]
                                                    ),

                                                    TableRow(
                                                        children: [
                                                          Container(
                                                            color:index1==11?CommonColors.black:CommonColors.white,
                                                            child:  index1==0 || index1==11?
                                                            Padding(
                                                              padding:  EdgeInsets.fromLTRB(0.0,CommonWidget.getInstance().widthFactor(context)*0.05,0.0,
                                                                  CommonWidget.getInstance().widthFactor(context)*0.05),
                                                              child: CommonWidget.getInstance().normalText(
                                                                  index1==0?CommonColors.darkGray:CommonColors.white,
                                                                  index1==0?"Points":"42",
                                                                  1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,
                                                                  index1==0?
                                                                  FontWeight.w200:
                                                                  FontWeight.w600
                                                              ),
                                                            ):
                                                            Padding(
                                                              padding:  EdgeInsets.fromLTRB(0.0,CommonWidget.getInstance().widthFactor(context)*0.05,0.0,
                                                                  CommonWidget.getInstance().widthFactor(context)*0.05),
                                                              child: TextField(
                                                                maxLength:2,
                                                                keyboardType: TextInputType.number,
                                                               decoration: InputDecoration(
                                                                  hintText: index1==0?"Points":'',
                                                                  hintStyle: const TextStyle(
                                                                    color:CommonColors.black,
                                                                      fontWeight: FontWeight.w600
                                                                  ),
                                                                  filled: true,
                                                                  fillColor:CommonColors.white,
                                                                  //border: InputBorder.none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                          ),

                          Visibility(
                            visible: Global.loginType=="2"?false:true,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left:6.0),
                                child: CommonWidget.getInstance().flexibleButton(
                                  context,
                                  Strings.update_score,
                                  CommonWidget.getInstance().widthFactor(context) * 0.6,
                                  CommonWidget.getInstance().widthFactor(context) * 0.13,
                                  CommonColors.primaryColor1,
                                  CommonColors.primaryColor1,
                                  CommonColors.white,
                                  this,
                                ),
                              ),
                            ),
                          ),

                        ]))))
    );
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {

  }
}
