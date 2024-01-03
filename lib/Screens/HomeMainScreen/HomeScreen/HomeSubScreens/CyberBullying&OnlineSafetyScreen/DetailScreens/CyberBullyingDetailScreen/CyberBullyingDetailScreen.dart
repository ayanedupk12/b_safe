

import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/CyberBullying&OnlineSafetyScreen/CyberBullying&OnlineSafetyScreen.dart';
import 'package:b_safe/Utils/AppConstants/English/CyberBullyingAndOnlineSafetyConstantsE.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Utils/Colors.dart';
import '../../../../../../../Utils/Textstyles.dart';

class CyberBullyingDetailScreen extends StatelessWidget {
  const CyberBullyingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cyber Bullying",
          style: CustomTextStyles.appBarTextStyle,
        ),
        leading: IconButton(
            onPressed: () {
              Get.to(CyberBullyingAndOnlineSafetyScreen());
            },
            icon: const Center(child: Icon(Icons.arrow_back_ios))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text(
                CBscreenConstantsE.mainTitle.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              Text(
                  CBscreenConstantsE.title.tr,
                style: CustomTextStyles.descriptionTextStyle,
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
