import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateMatch extends StatefulWidget {

  const CreateMatch({Key? key}) : super(key: key);

  @override
  _CreateMatchState createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_rounded)),

            SizedBox(
              height: CommonWidget.getInstance().widthFactor(context) * 0.02,
            ),

            Center(child: Image.asset("assets/images/create_match.png")),

            CommonWidget.getInstance().normalText(
                CommonColors.black,Strings.create_match,2,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,0,
                FontWeight.w600,fontfamily: false),

          ],
        ),
      ),
    );
  }
}
