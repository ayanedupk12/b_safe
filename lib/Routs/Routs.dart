import 'package:b_safe/Screens/AuthScreens/ForGotPassword/ForGotPasswordScreen.dart';
import 'package:b_safe/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:b_safe/Screens/AuthScreens/SignUpScreens/SignUpScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/CyberBullying&OnlineSafetyScreen/DetailScreens/CyberBullyingDetailScreen/CyberBullyingDetailScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/CyberBullying&OnlineSafetyScreen/DetailScreens/OnlineSafetyDetailScreen/OnlineSafetyDetailScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/PracticalAdviceScreen/DetailScreens/PracticalAdviceDetailScreen/PracticalAdviceDetailScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/PracticalAdviceScreen/DetailScreens/SGBVDifferentFormsDetailScreen/SGBVDifferentFormsDetailScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/PracticalAdviceScreen/DetailScreens/SexualGenderVoilenceScreen/SexualGenderVoilenceScreen.dart';
import 'package:b_safe/Screens/SecurityScreen/SecurityScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/CyberBullying&OnlineSafetyScreen/CyberBullying&OnlineSafetyScreen.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/MyTrustedContactsScreen/MyTrustedContactsScreen.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/PracticalAdviceScreen/PracticalAdviceScreen.dart';
import '../Screens/HomeMainScreen/HomeScreen/HomeSubScreens/TypesOfSupportScreen/TypeOfSupportScreen.dart';
import '../Screens/LanguageOrCountrySelectionScreen.dart';
import '../Screens/SplashScreen.dart';
import '../Utils/AppConstants/English/PracticalAdviceConstantsE.dart';
import 'RoutsNames.dart';

class AppRouts {
  static appRoutes() => [
        GetPage(name: RouteNames.splashScreen, page: () => SplashScreen()),
        GetPage(name: RouteNames.homeMainScreen, page: () => HomeMainScreen()),
        GetPage(
            name: RouteNames.languageOrCountrySelectionScreen,
            page: () => LanguageOrCountrySelectionScreen()),
        GetPage(
            name: RouteNames.myTrustedContactsScreen,
            page: () => MyTrustedContactsScreen()),
        GetPage(
            name: RouteNames.practicalAdviceScreen,
            page: () => PracticalAdviceScreen()),
        GetPage(
            name: RouteNames.typeOfSupportScreen,
            page: () => TypeOfSupportScreen()),
        GetPage(
            name: RouteNames.cyberBullyingAndOnlineSafetyScreen,
            page: () => CyberBullyingAndOnlineSafetyScreen()),
        GetPage(name: RouteNames.loginScreen, page: () => LogInScreen()),
        GetPage(name: RouteNames.signUpScreen, page: () => SignUpScreen()),
        GetPage(
            name: RouteNames.forgotPasswordScreen,
            page: () => ForGotPasswordScreen()),
        GetPage(
            name: RouteNames.cybberbullyingDetailScreen,
            page: () => CyberBullyingDetailScreen()),
        GetPage(
            name: RouteNames.onlineSafetyDetailScreen,
            page: () => OnlineSafetyDetailScreen()),
        GetPage(
            name: RouteNames.sGBVDifferentFormsDetailScreen,
            page: () => SGBVDifferentFormsDetailScreen(
                  appBarText: PractivcalAdvsMainConstantsE.appBarText.tr,
                )),
        GetPage(
            name: RouteNames.practicalAdviceDetailScreen,
            page: () => PracticalAdviceDetailScreen(
                  appBarText: PractivcalAdvsMainConstantsE.appBarText.tr,
                )),
        GetPage(
            name: RouteNames.sexualGenderVoilenceScreen,
            page: () => SexualGenderVoilenceScreen(
                  appBarText: PractivcalAdvsMainConstantsE.appBarText.tr,
                  title:
                      PractivcalAdvsMainConstantsE.sexualgebdebaseButontext.tr,
                )),
        GetPage(
            name: RouteNames.securityScreen,
            page: () => SecurityScreen()),
      ];
}
