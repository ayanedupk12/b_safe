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
import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if()
  // if (Firebase.apps.isEmpty) {
  //   await Firebase.initializeApp(
  //     name: 'YourAPP',
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   ).whenComplete(() {
  //     print("completedAppInitialize");
  //   });
  // }
  try{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }catch(e){
    print(e.toString());
  }
  // if(Platform.isAndroid){
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }else if(Platform.isIOS){
  //   try {
  //     await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //         apiKey: 'AIzaSyCq6JG60bOSG_V94AxSrBy4Qwp03S7nj9k',
  //         appId: '1:826321754483:ios:914ef743fce5f1bf69cd06',
  //         messagingSenderId: '826321754483',
  //         projectId: 'b-safe-4u',
  //         databaseURL: 'https://console.firebase.google.com/project/b-safe-4u/firestore/data/~2F', // Replace with your database URL
  //         storageBucket: 'b-safe-4u.appspot.com',
  //       ),
  //     );
  //   } catch (e) {
  //     print('Error initializing Firebase: $e');
  //   }
  // }
  // await dotenv.load(fileName: 'assets/config/.env');
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
        fallbackLocale:  Locale(__.selectedCountry),
        translations: Language(),
        locale: const Locale("us", "US"),
        initialRoute: RouteNames.splashScreen,
        getPages: AppRouts.appRoutes(),
      );
    });
  }
}
