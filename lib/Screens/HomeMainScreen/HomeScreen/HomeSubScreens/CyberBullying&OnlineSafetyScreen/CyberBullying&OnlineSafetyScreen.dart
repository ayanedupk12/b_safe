import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Routs/RoutsNames.dart';
import '../../../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../HomeMainScreenController.dart';
import 'C_BandO_Swidget.dart';

class CyberBullyingAndOnlineSafetyScreen extends StatelessWidget {
  const CyberBullyingAndOnlineSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMainScreenController>(builder: (__) {
      return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            CB_OSmainScreenConstantsE.appBarText.tr,
            style: CustomTextStyles.appBarTextStyle,
          ),
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(RouteNames.homeMainScreen);
              },
              icon: const Center(child: Icon(Icons.arrow_back_ios))),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * .05,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  CB_OSmainScreenConstantsE.mainTitle.tr,
                  style: CustomTextStyles.descriptionTextStyleB,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                C_BandO_Swidget(
                  onTap: () {
                    Get.toNamed(RouteNames.cybberbullyingDetailScreen);
                  },
                  text: CB_OSmainScreenConstantsE.cyberBullyingInConnection.tr,
                  image: ImagesPaths.cybberbullyingimage,
                ),
                const SizedBox(
                  height: 20,
                ),
                C_BandO_Swidget(
                  onTap: () {
                    Get.toNamed(RouteNames.onlineSafetyDetailScreen);
                  },
                  text: CB_OSmainScreenConstantsE.onlineSafety.tr,
                  image: ImagesPaths.onlinesafetyimage,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
