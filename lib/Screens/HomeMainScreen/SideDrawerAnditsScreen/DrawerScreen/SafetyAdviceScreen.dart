

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../../Utils/Colors.dart';
import '../../../../Utils/Textstyles.dart';

class SafetyAdviceScreen extends StatelessWidget {
  final String appBartext;
  const SafetyAdviceScreen({super.key, required this.appBartext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          appBartext.tr,
          style: CustomTextStyles.appBarTextStyle,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Center(child: Icon(Icons.arrow_back_ios))),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: Get.width * .05
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              size(),
              Text(SafetyAdviceConstatntsE.mainTitle1.tr,style: CustomTextStyles.topicTextStyle,),
              size(),
              Text(SafetyAdviceConstatntsE.text1.tr,style: CustomTextStyles.descriptionTextStyle),
              size(),
              Text(SafetyAdviceConstatntsE.text2.tr,style: CustomTextStyles.descriptionTextStyle),
              size(),
              Text(SafetyAdviceConstatntsE.mainTitle2.tr,style: CustomTextStyles.topicTextStyle,),
              size(),
              PrivacyBulletWidget(SafetyAdviceConstatntsE.bulletText1),size(),
              PrivacyBulletWidget(SafetyAdviceConstatntsE.bulletText2),size(),
              PrivacyBulletWidget(SafetyAdviceConstatntsE.bulletText3),size(),
              PrivacyBulletWidget(SafetyAdviceConstatntsE.bulletText4),size(),
              PrivacyBulletWidget(SafetyAdviceConstatntsE.bulletText5),size(),
              size(),
              size(),
            ],
          ),
        ),
      ),
    );
  }
}

size(){
  return SizedBox(height: 15,);
}


class PrivacyBulletWidget extends StatelessWidget {
  final String description;

  PrivacyBulletWidget(this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5,),
            Text(
              '\u2022',
              style: TextStyle(
                fontSize: 22
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Text(
                  description,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: CustomTextStyles.descriptionTextStyle,
                ),
              ),
            ),
          ],
        )
      ]
    );
  }
}

