import 'dart:async';
import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/Utils/AppConstants/English/HomeMainScreenConstantsE.dart';
import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    globalController.getAccessMicrophoneAndStorage();
    globalController.getCurrentLocation();
    Timer(const Duration(seconds: 2), () {
      globalController.splashServices();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Hero(
                    tag: 'awkyimage',
                    child: Image.asset(
                      globalController.switchValue
                          ? ImagesPaths.logoG1
                          : ImagesPaths.logoG,
                      height: 100,
                    ))),
            const SizedBox(
              height: 5,
            ),
            globalController.switchValue
                ? const Center(
              child: Text(''),
            )
                : Center(
                child: Text(
                  HomeMainScreenContantsE.splashscreenConstants.tr,
                  style: CustomTextStyles.logoStyle,
                )),
          ],
        ),
        );
  }
}
