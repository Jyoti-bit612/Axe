import 'package:axe/controller/current_league_controller.dart';
import 'package:axe/controller/league_controller.dart';
import 'package:axe/controller/pasword_counter.dart';
import 'package:axe/controller/player_controller.dart';
import 'package:axe/controller/prevoius_league_controller.dart';
import 'package:axe/controller/profile_controller.dart';
import 'package:axe/controller/upcoming_league_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>CurrentLeagueController());
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>LeagueController());
    Get.lazyPut(()=>CounterController());
    Get.lazyPut(()=>PlayerController());
    Get.lazyPut(()=>PreviousLeagueController());
    Get.lazyPut(()=>UpcomingLeagueController());
    Get.lazyPut(()=>ProfileController());
  }
}