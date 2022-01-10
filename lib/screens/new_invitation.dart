import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';

class NewInvitaton extends StatefulWidget {
  const NewInvitaton({Key? key}) : super(key: key);

  @override
  NewInvitatonState createState() => NewInvitatonState();
}

class NewInvitatonState extends State<NewInvitaton> with SingleTickerProviderStateMixin implements CallBackInterface  {

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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

                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back_rounded)),


                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05),
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.black, Strings.new_invitation,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,2,FontWeight.w600),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                upperView(),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                ),



                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                ),

                TabBar(
                  labelColor: CommonColors.black,
                  unselectedLabelColor: CommonColors.black,
                  controller: _tabController,
                  // indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.only(top:CommonWidget.getInstance().widthFactor(context) * 0.111),
                  indicatorWeight: 0.1,
                  //labelPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  indicator:  const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CommonColors.primaryColor1,
                        CommonColors.imageRed,
                      ],
                    ),
                  ),

                  tabs: const [
                    Tab(
                      text:Strings.matches,),

                    Tab(
                      text:Strings.player ,
                    ),
                  ],

                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,

                    children: <Widget>[
                      aceptedView(),
                      rejectedView(),
                    ],
                  ),
                ),

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

  aceptedView() {

  }

  rejectedView() {


  }

  upperView() {

    return   ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount:  3,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Padding(
              padding:EdgeInsets.all( CommonWidget.getInstance().widthFactor(context) * 0.04),
              child: Row(
                children: [

                  Container(
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
                  SizedBox(
                    width: CommonWidget.getInstance().widthFactor(context) * 0.03,
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black,"David",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w900,fontfamily: false),

                          CommonWidget.getInstance().normalText(
                              CommonColors.darkGray,"Location: Southfield",0,CommonWidget.getInstance().widthFactor(context)*0.028,FontStyle.normal,1,FontWeight.w600),
                        ]),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: CommonColors.imageRed,),
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context)*0.02),
                        ),
                        child: Icon(Icons.clear_outlined,color:CommonColors.imageRed),
                        onPressed: () {},
                      ),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: CommonColors.green,),
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context)*0.02),
                        ),
                        child: Icon(Icons.check,color:CommonColors.green),
                        onPressed: () {},
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        }),

  }

}
