import 'dart:async';
import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:b_safe/Utils/AppConstants/English/HomeMainScreenConstantsE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Textstyles.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  GlobalController globalController = Get.find();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {

     ///Get.offAllNamed(RouteNames.languageOrCountrySelectionScreen);
   globalController.splashServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Hero(
                tag: 'awkyimage',
                  child: Image.asset(
            'assets/images/logo.png',
            height: 100,
          ))),
           const SizedBox(height: 5,),
           Center(
              child: Text(
            HomeMainScreenContantsE.splashscreenConstants.tr,
            style: CustomTextStyles.logoStyle,
          )),
        ],
      ),
    );
  }
}
