import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationClass extends StatelessWidget {
  const NotificationClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.04),
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
                height: CommonWidget.getInstance().widthFactor(context) * 0.03,
              ),

              CommonWidget.getInstance().normalText(
                  CommonColors.black,Strings.notification,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w600,fontfamily: false),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Expanded(
                child: ListView.builder(
                    itemCount:  4,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.03),
                          child:  Row(
                                children: [
                                   Container(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.15,
                                    width: 2.5,
                                    color: CommonColors.primaryColor1Material.shade50,
                                  ),

                                  SizedBox(
                                    width: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                                 Image.asset("assets/images/yellowi.png"),

                                  SizedBox(
                                    width: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),

                             Expanded(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   CommonWidget.getInstance().normalText(
                                       CommonColors.black,"Did you know.",0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: false),

                                   Padding(
                                     padding:  EdgeInsets.only(top:CommonWidget.getInstance().widthFactor(context) * 0.015),
                                     child: CommonWidget.getInstance().normalText(
                                         CommonColors.darkGray,"Here is something that you might to know.",0,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w500),
                                   ),
                                 ],
                               ),
                             ),
                                  SizedBox(
                                    width: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                               Icon(Icons.clear,color: CommonColors.black,)

                                ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );  }

}
