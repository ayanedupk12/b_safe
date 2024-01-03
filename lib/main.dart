import 'package:b_safe/Routs/Routs.dart';
import 'package:b_safe/Translations/Languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GlobalController/GlobalController.dart';
import 'Routs/RoutsNames.dart';

void main() {
  Get.put(GlobalController());
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
        locale: Locale(
            __.selectedLanguageList1[__.initialIndex].toString(),
            __.selectedLanguageList2[__.initialIndex].toString()),
        initialRoute: RouteNames.splashScreen,
        getPages: AppRouts.appRoutes(),
      );
    });
  }
}
