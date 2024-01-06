

import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/CyberBullying&OnlineSafetyScreen/DetailScreens/OnlineSafetyDetailScreen/OnlineSafetBulletWidget.dart';
import 'package:b_safe/Utils/AppConstants/English/CyberBullyingAndOnlineSafetyConstantsE.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../Routs/RoutsNames.dart';
import '../../../../../../../Utils/Colors.dart';
import '../../../../../../../Utils/Textstyles.dart';
import '../../../../../HomeMainScreen.dart';
import '../../CyberBullying&OnlineSafetyScreen.dart';
import 'OnlineSafetyWidgets.dart';

class OnlineSafetyDetailScreen extends StatelessWidget {
  const OnlineSafetyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Get.offAllNamed(RouteNames.cyberBullyingAndOnlineSafetyScreen);
            },
            icon: Center(child: Icon(Icons.arrow_back_ios))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              size2(),
              Text(
                OSscreenConstantsE.mainTitle,
                style: CustomTextStyles.topicTextStyle,
              ),
              size2(),
              ///socailMedia//////////
              OnlineSafetyWidget(title: OSscreenConstantsE.socialMedia.tr, number: '1',),
              size1(),
              Text(OSscreenConstantsE.socialMediaText.tr,
                style: CustomTextStyles.descriptionTextStyle),
              ///OnlineSafetyBullets////
              OnlineSafetBulletWidget(text: OSscreenConstantsE.socialMediaBulletText1.tr),
              OnlineSafetBulletWidget(text: OSscreenConstantsE.socialMediaBulletText2.tr),
              OnlineSafetBulletWidget(text: OSscreenConstantsE.socialMediaBulletText3.tr),
              OnlineSafetBulletWidget(text: OSscreenConstantsE.socialMediaBulletText4.tr),
              ///messegings//////
              OnlineSafetyWidget(title: OSscreenConstantsE.messegingTitle.tr, number: '1',),
              size1(),
              Text(OSscreenConstantsE.messegingText.tr,
                style: CustomTextStyles.descriptionTextStyle,),
              size1(),
              ///phone//////////
              OnlineSafetyWidget(title: OSscreenConstantsE.phone.tr, number: '1',),
              size1(),
              Text(OSscreenConstantsE.phoneText1.tr,
                style: CustomTextStyles.descriptionTextStyle,),
              size1(),
              Text(OSscreenConstantsE.phoneBulluetTitle,
                style: CustomTextStyles.topicTextStyle,
              ),
              ///phoneBullet////
              OnlineSafetBulletWidget(text: OSscreenConstantsE.phoneBulluetText1.tr),
              OnlineSafetBulletWidget(text: OSscreenConstantsE.phoneBulluetText2.tr),
              OnlineSafetBulletWidget(text: OSscreenConstantsE.phoneBulluetText3.tr),
              size2(),
            ],
          ),
        ),
      ),
    );
  }
}

size1(){
  return const SizedBox(height: 10,);
}
size2(){
  return const SizedBox(height: 15,);
}
