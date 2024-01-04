// import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
// import 'package:b_safe/Screens/SecurityScreen/SecurityScreen.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SideDrawerController extends GetxController {
//   bool switchValue = false;
//   bool firstTime = false;
//
//   @override
//   void onInit() {
//     super.onInit();
//     swithboolFromSharedpreference();
//     checkappOpenFirstTimeOrnot();
//   }
//
//   void swithboolFromSharedpreference() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     switchValue = pref.getBool('isSecure') ?? false;
//   }
//
//   void checkappOpenFirstTimeOrnot() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     switchValue = pref.getBool('firstTime') ?? false;
//   }
//
//   void splashSerVices() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     switchValue = !switchValue;
//     if (switchValue == false) {
//       pref.setBool('isSecure', true);
//       Get.offAll(HomeMainScreen());
//       print("Switch value set to false");
//       print(switchValue);
//     } else {
//       pref.setBool('isSecure', false);
//       Get.offAll(SecurityScreen());
//       print("Switch value set to true");
//       print(switchValue);
//     }
//
//     update();
//   }
// }
