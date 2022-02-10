import 'package:axe/controller/binding.dart';
import 'package:axe/screens/change_password.dart';
import 'package:axe/screens/create_league.dart';
import 'package:axe/screens/create_match.dart';
import 'package:axe/screens/current_league_detail.dart';
import 'package:axe/screens/dashbaord.dart';
import 'package:axe/screens/edit_score.dart';
import 'package:axe/screens/forgotpassword.dart';
import 'package:axe/screens/login.dart';
import 'package:axe/screens/new_invitation.dart';
import 'package:axe/screens/notification.dart';
import 'package:axe/screens/other_user_profile.dart';
import 'package:axe/screens/practice_match.dart';
import 'package:axe/screens/prevoius_league_detail.dart';
import 'package:axe/screens/score_dasboard.dart';
import 'package:axe/screens/signup.dart';
import 'package:axe/screens/splash.dart';
import 'package:axe/screens/upcoming_league_detail.dart';
import 'package:axe/screens/user_profile.dart';
import 'package:axe/util/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: "/",
      initialBinding: HomeBinding(),
      routes: {
       // '/':(context)=>Splash(),
        '/login':(context)=>Login(),
        '/signup':(context)=>SignUp(),
        '/home':(context)=>DashBoard(0),
        '/currentLeague':(context)=>DashBoard(1),
        '/playerlist':(context)=>DashBoard(2),
        '/profile':(context)=>DashBoard(3),
        '/createMatch':(context)=>CreateMatch(),
        '/createLeague':(context)=>CreateLeague(),
        '/changePassword':(context)=>ChangePassword(),
        '/currentLeagueDetail':(context)=>CurrentLeagueDetail(),
        '/forgotPassword':(context)=>ForgotPassword(),
        '/newInvitaton':(context)=>NewInvitaton(),
        '/editScore':(context)=>EditScore(),
        '/notificationClass':(context)=>NotificationClass(),
        '/otherUserProfile':(context)=>OtherUserProfile("","","","","","","","","","",),
        '/practiceMatch':(context)=>PracticeMatch(),
        '/previousLeagueDetail':(context)=>PreviousLeagueDetail(),
        '/scoreDashboard':(context)=>ScoreDashboard(),
        '/upcomingLeagueDetail':(context)=>UpcomingLeagueDetail(),
        '/userProfile':(context)=>UserProfile(),
      },
      navigatorKey: Global.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Axe',
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Splash(),
    );
  }

}