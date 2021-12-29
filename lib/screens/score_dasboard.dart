import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/playerlist.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';

class ScoreDashboard extends StatefulWidget {
  const ScoreDashboard({Key? key}) : super(key: key);

  @override
  _ScoreDashboardState createState() => _ScoreDashboardState();
}

class _ScoreDashboardState extends State<ScoreDashboard> with SingleTickerProviderStateMixin implements CallBackInterface  {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back_rounded)),

                  Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: CommonWidget.getInstance().flexibleButton(
                      context,
                      Strings.end_game,
                      CommonWidget.getInstance().widthFactor(context) * 0.32,
                      CommonWidget.getInstance().widthFactor(context) * 0.13,
                      CommonColors.primaryColor1,
                      CommonColors.primaryColor1,
                      CommonColors.white,
                      this,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.02,
              ),

              Card(
                elevation: 4,
                  child:Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidget.getInstance().normalText(
                                CommonColors.black,"AXE WORLD LEAGUE",0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                            Container(
                              decoration: BoxDecoration(
                                color: CommonColors.red,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(color:CommonColors.red)
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CommonWidget.getInstance().normalText(
                                    CommonColors.white,Strings.live_match,0,CommonWidget.getInstance().widthFactor(context)*0.018,FontStyle.normal,1,FontWeight.w900,fontfamily: false),
                              ),

                            )
                          ],
                        ),
                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                        ),

                     CommonWidget.getInstance().normalText(
                       CommonColors.darkGray,"Match 04/ Season 5",0,CommonWidget.getInstance().widthFactor(context)*0.019,FontStyle.normal,0,FontWeight.w900,fontfamily: false),

                       SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                              height:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                ),
                                shape: BoxShape.circle,

                              ),
                              child:  const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                  )
                              ),
                            ),

                            CommonWidget.getInstance().normalText(
                                CommonColors.black,"05 : 07",0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,
                                FontWeight.w900,fontfamily: false),


                            Container(
                              width:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                              height:  CommonWidget.getInstance().widthFactor(context) * 0.27,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                ),
                                shape: BoxShape.circle,

                              ),
                              child:  const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                  )
                              ),
                            )
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [

                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,"Ragnar",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),


                              CommonWidget.getInstance().normalText(
                                  CommonColors.red,"vs",0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),



                              CommonWidget.getInstance().normalText(
                                  CommonColors.black,"Floki",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                                  FontWeight.w600,fontfamily: false),
                            ],
                          ),
                        ),


                      ],
          ),
                  )
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset("assets/images/score.png",width:CommonWidget.getInstance().widthFactor(context)*0.3),

                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:  10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context)*0.045,
                                right:CommonWidget.getInstance().widthFactor(context)*0.045),
                            child: Table(
                              defaultColumnWidth: FixedColumnWidth(CommonWidget.getInstance().widthFactor(context)*0.1),
                              border: TableBorder.all(
                                  color: CommonColors.black,
                                  style: BorderStyle.solid,
                                  width: 1),

                              children: [
                                TableRow(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                            child: TextFormField(
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration.collapsed(
                                                hintText: '0',
                                              ),
                                              onSaved: (String? value) {

                                              },
                                            )
                                          ),
                                        ],
                                      ),

                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
                                            child: TextFormField(
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration.collapsed(
                                                hintText: '0',
                                              ),
                                              onSaved: (String? value) {

                                              },

                                            )
                                          ),
                                        ],
                                      ),

                                    ]
                                ),
                              ],
                            )
                          );
                        }),
                  ),

                  Image.asset("assets/images/score.png",width:CommonWidget.getInstance().widthFactor(context)*0.3,)
                ],
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget(Strings.call_killshot,CommonWidget.getInstance().widthFactor(context) * 0.34),


                  Container(
                    color: CommonColors.black,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.white,"31",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                          FontWeight.w600,fontfamily: false),
                    ) ,

                  ),


                  Container(
                    color: CommonColors.black,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonWidget.getInstance().normalText(
                          CommonColors.white,"31",0,CommonWidget.getInstance().widthFactor(context)*0.029,FontStyle.normal,0,
                          FontWeight.w600,fontfamily: false),
                    ) ,

                  ),


                  buttonWidget(Strings.call_killshot,CommonWidget.getInstance().widthFactor(context) * 0.34,)

                ],
              ),


              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget(Strings.winner,CommonWidget.getInstance().widthFactor(context) * 0.4),
                  buttonWidget(Strings.winner,CommonWidget.getInstance().widthFactor(context) * 0.4),

                ],
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget(Strings.switch_side,CommonWidget.getInstance().widthFactor(context) * 0.4),
                  buttonWidget(Strings.sudden_death_throw,CommonWidget.getInstance().widthFactor(context) * 0.4),

                ],
              ),


              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left:6.0),
                child: CommonWidget.getInstance().flexibleButton(
                  context,
                  Strings.update_score,
                  double.infinity,
                  CommonWidget.getInstance().widthFactor(context) * 0.13,
                  CommonColors.primaryColor1,
                  CommonColors.primaryColor1,
                  CommonColors.white,
                  this,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }





  buttonWidget(String text,double width) {
    return SizedBox(
      height: CommonWidget.getInstance().widthFactor(context) * 0.1,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: CommonColors.darkGray)

              )),

          onPressed: () {},

          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: CommonColors.darkGray,
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

