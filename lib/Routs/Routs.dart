import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/CyberBullying&OnlineSafetyScreen/CyberBullying&OnlineSafetyScreen.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/MyTrustedContactsScreen/MyTrustedContactsScreen.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/PracticalAdviceScreen/PracticalAdviceScreen.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/TypesOfSupportScreen/TypeOfSupportScreen.dart';
import '../Screens/LanguageOrCountrySelectionScreen.dart';
import '../Screens/SplashScreen.dart';
import 'RoutsNames.dart';

class AppRouts{
  static appRoutes()=>[
    GetPage(name: RouteNames.splashScreen, page: ()=> SplashScreen()),
    GetPage(name: RouteNames.homeMainScreen, page: ()=>HomeMainScreen()),
    GetPage(name: RouteNames.languageOrCountrySelectionScreen, page: ()=> LanguageOrCountrySelectionScreen()),
    GetPage(name: RouteNames.myTrustedContactsScreen, page: ()=> MyTrustedContactsScreen()),
    GetPage(name: RouteNames.practicalAdviceScreen, page: ()=> PracticalAdviceScreen()),
    GetPage(name: RouteNames.typeOfSupportScreen, page: ()=> TypeOfSupportScreen()),
    GetPage(name: RouteNames.cyberBullyingAndOnlineSafetyScreen, page: ()=>const CyberBullyingAndOnlineSafetyScreen()),
  ];
}