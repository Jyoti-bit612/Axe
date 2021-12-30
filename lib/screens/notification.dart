import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_rounded)),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.01,
              ),

              CommonWidget.getInstance().normalText(
                  CommonColors.black,Strings.notification,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w600,fontfamily: false),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.03,
              ),

              ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:  4,
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding:  EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.03),
                        child: ListTile(
                            leading: Row(
                              children: [
                                const Divider(
                                  height: 20,
                                  thickness: 1,
                                  color: CommonColors.primaryColor1,
                                ),
                               Image.asset("assets/images/purplei.png"),
                              ],
                            ),

                            title: CommonWidget.getInstance().normalText(
                                CommonColors.black,"Did you know.",0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: false),

                            subtitle:  Padding(
                              padding:  EdgeInsets.only(top:CommonWidget.getInstance().widthFactor(context) * 0.015),
                              child: CommonWidget.getInstance().normalText(
                                  CommonColors.darkGray,"Here is something that you might to know.",0,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w500),
                            ),

                            trailing: Icon(Icons.clear,color: CommonColors.black,)

                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );  }

}
