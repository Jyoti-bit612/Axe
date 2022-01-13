import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PracticeMatch extends StatelessWidget implements CallBackInterface  {
  const PracticeMatch({Key? key}) : super(key: key);

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
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_rounded)),

                
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black,Strings.practice_match,0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,0,FontWeight.w700,fontfamily: true),


                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                Row(
                  children: [

                    CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.hatchet,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,2,FontWeight.w600,fontfamily: true),

                    SizedBox(
                      width: CommonWidget.getInstance().widthFactor(context) * 0.05,
                    ),

                    CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.big_axe,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,2,FontWeight.w600,fontfamily: true),
                    SizedBox(
                      width: CommonWidget.getInstance().widthFactor(context) * 0.05,
                    ),

                    CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.team_play,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,2,FontWeight.w600,fontfamily: true),
                    SizedBox(
                      width: CommonWidget.getInstance().widthFactor(context) * 0.05,
                    ),

                    CommonWidget.getInstance().normalText(
                        CommonColors.black, Strings.duals,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,2,FontWeight.w600,fontfamily: true),

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
                        width:  CommonWidget.getInstance().widthFactor(context) * 0.16,
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
                        width:  CommonWidget.getInstance().widthFactor(context) * 0.15,
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
                        width:  CommonWidget.getInstance().widthFactor(context) * 0.19,
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
                        width:  CommonWidget.getInstance().widthFactor(context) * 0.12,
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
                  height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                ),

                Center(child: Image.asset("assets/images/practice_matches.png",width:CommonWidget.getInstance().widthFactor(context)*0.3)),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:  12,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context)*0.045,
                                  right:CommonWidget.getInstance().widthFactor(context)*0.045),
                              child: Table(
                                defaultColumnWidth: FixedColumnWidth(CommonWidget.getInstance().widthFactor(context)*0.1),
                                border: TableBorder.all(
                                    color: CommonColors.darkGray,
                                    style: BorderStyle.solid,
                                    width: 1),

                                children: [
                                  TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                          child: CommonWidget.getInstance().normalText(
                                              CommonColors.black,index==0?"Throw":index==11?"Total":index.toString(),1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,0,FontWeight.w600,fontfamily: true),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                          child: TextFormField(
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration.collapsed(
                                              hintText: '',
                                            ),
                                            onSaved: (String? value) {

                                            },

                                          )
                                        ),
                                      ]
                                  ),
                                ],
                              )
                            );
                          }),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget(Strings.call_killshot,CommonWidget.getInstance().widthFactor(context) * 0.4,context),

                    buttonWidget(Strings.reset_throw,CommonWidget.getInstance().widthFactor(context) * 0.4,context),

                  ],
                ),


                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget(Strings.drop,CommonWidget.getInstance().widthFactor(context) * 0.4,context),
                    buttonWidget(Strings.zero,CommonWidget.getInstance().widthFactor(context) * 0.4,context),

                  ],
                ),

              ],
            )
          ),
        ),
      ),
    );
  }

  buttonWidget(String text,double width,BuildContext context) {
    return SizedBox(
      height: CommonWidget.getInstance().widthFactor(context) * 0.1,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: CommonColors.chat_gray,
              onPrimary: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: CommonColors.chat_gray)

              )),

          onPressed: () {},

          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: CommonColors.white,
                  fontFamily: "Lato",
                  fontSize: CommonWidget.getInstance().widthFactor(context) *
                      0.04,
                  fontWeight: FontWeight.bold))),
    );
  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {

  }

}

