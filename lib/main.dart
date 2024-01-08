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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getBool('isSecure') ?? false;
  prefs.getBool('firstTime') ?? false;
  Get.put(GlobalController());
  Get.put(HomeMainScreenController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(builder: (__) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        fallbackLocale: const Locale("en_US"),
        translations: Language(),
        locale: const Locale("us", "US"),
        initialRoute: RouteNames.splashScreen,
        getPages: AppRouts.appRoutes(),
      );
    });
  }
}
