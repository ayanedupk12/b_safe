import 'package:b_safe/Routs/Routs.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreenController.dart';
import 'package:b_safe/Translations/Languages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'GlobalController/GlobalController.dart';
import 'Routs/RoutsNames.dart';
import 'firebase_options.dart';

bool switchValue = false;
bool firstTime = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  switchValue = prefs.getBool('isSecure') ?? false;
  switchValue = prefs.getBool('firstTime') ?? false;
  Get.put(GlobalController());
  Get.put(HomeMainScreenController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(builder: (__) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        fallbackLocale: const Locale("en_US"),
        translations: Language(),
        locale: const Locale(
            "us",
           "US"),
        initialRoute: RouteNames.splashScreen,
        getPages: AppRouts.appRoutes(),
      );
    });
  }
}
