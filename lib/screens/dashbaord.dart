import 'package:axe/controller/current_league_controller.dart';
import 'package:axe/controller/home_controller.dart';
import 'package:axe/controller/player_controller.dart';
import 'package:axe/controller/profile_controller.dart';
import 'package:axe/screens/current_league.dart';
import 'package:axe/screens/home.dart';
import 'package:axe/screens/playerSide/user_profile.dart';
import 'package:axe/screens/playerlist.dart';
import 'package:axe/screens/venueSide/profile.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class DashBoard extends StatefulWidget {
  int _currentIndex = 0;

  DashBoard(int _currentIndex,){
    this._currentIndex=_currentIndex;
  }

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late List<Widget> _children;
  var pre_backpress;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _children = [Home(),CurrentLeague(),PlayerList(), Global.loginType=="2"?UserProfile():Profile()];  // 2 for user and 1 for venue
     pre_backpress=DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final timeGap = DateTime.now().difference(pre_backpress);
        final cantExit = timeGap >= const Duration(seconds: 4);
        pre_backpress = DateTime.now();
        if(cantExit){
          const snack = SnackBar(content:  Text('Press Back button again to Exit'),duration:  Duration(seconds: 2),);
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false; // false will do nothing when back press
        }else{
          return true;   // true will exit the app
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: _children[widget._currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: widget._currentIndex, // new
          type: BottomNavigationBarType.fixed,
          selectedItemColor:  CommonColors.primaryColor1,
          unselectedItemColor: CommonColors.black,
          items: const [
             BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/home.png")),
                 label: Strings.home

            ),
             BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/league.png")),
                 label: Strings.league
            ),
             BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/player.png")),
                 label: Strings.player
            ),
             BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/profile.png")),
                 label: Strings.profile
            )
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    final HomeController controller = Get.find();
    final PlayerController playerController = Get.find();
    final CurrentLeagueController currentController = Get.find();
    final ProfileController profileController = Get.find();

    switch(index){

      case 0:
        controller.getUpcomingLeague();
        controller.getprevoiusLeague();
        controller.getTopPlayer();
        break;

      case 1:
        currentController.getCurrentLeague();
        break;

      case 2:
        playerController.getPlayerList();
        break;

      case 3:
        profileController.getProfile();
        profileController.firstNameCheck.value=true;
        profileController.lastNameCheck.value=true;
        profileController.phoneCheck.value=true;
        break;
    }
    setState(() {
      widget._currentIndex = index;
    });
  }

   getLoginType() async {
    print(await Global.getStringValuesSF(Constant.LoginType));
     Global.loginType= await Global.getStringValuesSF(Constant.LoginType);
  }
}