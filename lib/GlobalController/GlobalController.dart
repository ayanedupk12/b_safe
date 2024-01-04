import 'dart:ui';
import 'package:b_safe/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/SideDrawerAnditsScreen/SideDrawerAnditsScreenController.dart';
import 'package:b_safe/Screens/LanguageOrCountrySelectionScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Screens/HomeMainScreen/HomeMainScreen.dart';
import '../Screens/SecurityScreen/SecurityScreen.dart';

class GlobalController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;

  bool switchValue = false;
  bool firstTime = false;

  @override
  void onInit() {
    super.onInit();
    swithboolFromSharedpreference();
    checkappOpenFirstTimeOrnot();
  }
  void swithboolFromSharedpreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switchValue = pref.getBool('isSecure') ?? false;
  }

  void checkappOpenFirstTimeOrnot() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    firstTime = pref.getBool('firstTime') ?? false;
  }

  void splashServices() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (firstTime == false) {
      firstTime == pref.setBool('firstTime', true);
      Get.to(const LanguageOrCountrySelectionScreen());
    } else if (auth.currentUser == null) {
      Get.to(LogInScreen());
    } else if (switchValue == false) {
      Get.to(HomeMainScreen());
    } else {
      Get.to(SecurityScreen());
    }
    update();
  }

  void securityModeCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool currentSwitchValue = pref.getBool('isSecure') ?? false;

    bool updatedSwitchValue = !currentSwitchValue;

    pref.setBool('isSecure', updatedSwitchValue);

    switchValue = updatedSwitchValue;

    if (updatedSwitchValue == true) {
      Get.offAll(SecurityScreen())?.then((_) {
        update();
      });
    } else {
      Get.offAll(HomeMainScreen())?.then((_) {
        update();
      });
    }
  }


  Future<void> callPolice() async {
    const phoneNumber = '112'; // Your desired phone number
    const url = 'tel:$phoneNumber';
    {
      final URL = Uri.parse(url);
      if (!await launchUrl(URL)) {
        throw Exception('Could not launch $URL');
      }
    }
  }
}
