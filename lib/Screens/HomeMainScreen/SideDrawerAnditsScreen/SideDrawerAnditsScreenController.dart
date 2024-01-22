// import 'dart:ui';
//
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SideDrawerController extends GetxController {
//
//
//
//   List<String> countryList = [
//     "English",
//     "Polish",
//     "Czech Republic",
//     "Slovak",
//     "Ukrainian",
//   ];
//
//   String selectedCountry = "English";
//
//   @override
//   void onInit() async {
//     super.onInit();
//     initPreferences();
//     updateLocale(selectedCountry);
//   }
//   Future<void> initPreferences() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     selectedCountry = pref.getString('selectedCountry') ?? selectedCountry;
//   }
//
//   void updateLocale(String selectedCountry) async{
//     final SharedPreferences preferences = await SharedPreferences.getInstance();
//     switch (selectedCountry) {
//       case "Polish":
//         Get.updateLocale(const Locale('pl', 'PL'));
//         await preferences.setString("selectedCountry", selectedCountry);
//         break;
//       case "English":
//         Get.updateLocale(const Locale('en', 'US'));
//         await preferences.setString("selectedCountry", selectedCountry);
//         break;
//       case "Czech Republic":
//         Get.updateLocale(const Locale('cs', 'CZ'));
//         await preferences.setString("selectedCountry", selectedCountry);
//         break;
//       case "Slovak":
//         Get.updateLocale(const Locale('sk', 'SK'));
//         await preferences.setString("selectedCountry", selectedCountry);
//         break;
//       case "Ukrainian":
//         Get.updateLocale(const Locale('uk', 'UA'));
//         await preferences.setString("selectedCountry", selectedCountry);
//         break;
//       default:
//         Get.updateLocale(const Locale('en', 'US'));
//         break;
//     }
//     update();
//   }
// }
