import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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


class _PreviousState extends State<PreviousLeagueDetail>  with SingleTickerProviderStateMixin implements CallBackInterface {
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
          child:Padding(
            padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.03),
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
                TabBar(
                  labelColor: CommonColors.black,
                  unselectedLabelColor: CommonColors.black,
                  controller: _tabController,
                  // indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.only(top:CommonWidget.getInstance().widthFactor(context) * 0.12),
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
                      text:Strings.player ,
                    ),
                    Tab(
                      text:Strings.matches,),

                  ],

                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                SizedBox(
                  height: 1500,
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: <Widget>[
                      playerWidget(context),
                        Matches(),
                     // matchedWidget(context),

                     ])

                )],
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

  playerWidget(BuildContext context) {
    return Column(
      children: [
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
              SizedBox(
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

        Expanded(
          child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              // shrinkWrap: true,
              itemCount:  7,
              separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 8),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
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
                              child: const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                                  )
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
        ),

        SizedBox(
          height: CommonWidget.getInstance().heightFactor(context) * 0.03,
        ),

      ],
    );
  }


}

class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> implements CallBackInterface {

  @override
  Widget build(BuildContext context) {
    return matchedWidget(context);
  }

  matchedWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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


        Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount:  9,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                      ),

                      SizedBox(
                        width:CommonWidget.getInstance().widthFactor(context) * 0.49,
                        child: CommonWidget.getInstance().normalText(
                            CommonColors.black, "Match"+index.toString(),0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600),
                      ),
                      SizedBox(
                        height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                      ),

                      SizedBox(
                        height: CommonWidget.getInstance().widthFactor(context)*0.56,
                        child: Card(
                          elevation: 4,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:  12,
                              itemBuilder: (context,innerIndex){
                                return  Padding(
                                  padding: const EdgeInsets.only(top:8.0,bottom: 0),
                                  child:Table(
                                    defaultColumnWidth: innerIndex==0?
                                    FixedColumnWidth(CommonWidget.getInstance().widthFactor(context)*0.25):
                                    FixedColumnWidth(CommonWidget.getInstance().widthFactor(context)*0.14),
                                    border: TableBorder.all(
                                        color: CommonColors.grayColor,
                                        style: BorderStyle.solid,
                                        width: 1),

                                    children: [
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0.0,CommonWidget.getInstance().widthFactor(context)*0.015,0.0,
                                                  CommonWidget.getInstance().widthFactor(context)*0.015),
                                              child: CommonWidget.getInstance().normalText(
                                                  CommonColors.grayColor, innerIndex==0?"Throw":innerIndex==11?"T.P":innerIndex.toString(),1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,2,FontWeight.w600),
                                            ),
                                          ]
                                      ),
                                      TableRow(
                                          children: [
                                            innerIndex==0?columnNameWidget():

                                            Container(
                                              color:innerIndex==11?CommonColors.black:CommonColors.white,
                                              child: Padding(
                                                padding:  EdgeInsets.fromLTRB(0.0,CommonWidget.getInstance().widthFactor(context)*0.0845,0.0,
                                                    CommonWidget.getInstance().widthFactor(context)*0.0845),
                                                child: CommonWidget.getInstance().normalText(
                                                    innerIndex==11?CommonColors.white:CommonColors.black,
                                                    innerIndex==11?"42":"3",
                                                    1,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,2,
                                                    innerIndex==11?
                                                    FontWeight.w200:
                                                    FontWeight.w600
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),

                                      TableRow(
                                          children: [
                                            innerIndex==0?columnNameWidget():

                                            Padding(
                                              padding:  EdgeInsets.fromLTRB(0.0,CommonWidget.getInstance().widthFactor(context)*0.0845,0.0,
                                                  CommonWidget.getInstance().widthFactor(context)*0.0845),
                                              child: CommonWidget.getInstance().normalText(
                                                  CommonColors.black,
                                                  innerIndex==11?"32":"5",
                                                  1,CommonWidget.getInstance().widthFactor(context)*0.045,FontStyle.normal,2,
                                                  innerIndex==11?
                                                  FontWeight.w200:
                                                  FontWeight.w600
                                              ),
                                            ),
                                          ]
                                      ),

                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  columnNameWidget(){
    return Padding(
      padding:EdgeInsets.fromLTRB(0.0,CommonWidget.getInstance().widthFactor(context)*0.02,0.0,
        CommonWidget.getInstance().widthFactor(context)*0.01),
      child: Column(
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
              child: const Padding(
                  padding: EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:AssetImage("assets/images/dummypic.jpg"),
                  )
              ),
            ),

            SizedBox(
              height: CommonWidget.getInstance().heightFactor(context) * 0.01,
            ),

            CommonWidget.getInstance().normalText(
                CommonColors.black,"David",0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w700,fontfamily: true),

      ],
      ),
    );

  }

  @override
  void widgetCallBack(String title, String value, BuildContext context) {
    // TODO: implement widgetCallBack
  }

}




