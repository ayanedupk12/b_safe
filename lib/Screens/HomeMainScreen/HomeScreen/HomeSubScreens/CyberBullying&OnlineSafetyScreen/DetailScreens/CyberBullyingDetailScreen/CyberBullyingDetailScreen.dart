import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Utils/AppConstants/EnglishConstants.dart';
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
        title: SizedBox(
          width: Get.width*0.6,
          child: Text(
            CB_OSmainScreenConstantsE.cyberBullyingInConnection.tr,
            style: CustomTextStyles.appBarTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RouteNames.cyberBullyingAndOnlineSafetyScreen);
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
                "CBscreenConstantsE.mainTitle.tr",
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
