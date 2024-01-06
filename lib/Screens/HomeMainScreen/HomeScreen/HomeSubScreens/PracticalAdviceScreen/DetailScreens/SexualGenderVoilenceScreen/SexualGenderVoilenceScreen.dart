



import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:b_safe/Utils/AppConstants/English/PracticalAdviceConstantsE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Utils/Colors.dart';
import '../../../../../../../Utils/Textstyles.dart';

class SexualGenderVoilenceScreen extends StatelessWidget {
  final String appBarText;
  final String title;
  const SexualGenderVoilenceScreen({super.key, required this.appBarText, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          appBarText,
          style: CustomTextStyles.logoStyle.copyWith(fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RouteNames.practicalAdviceScreen);            },
            icon: const Center(child: Icon(Icons.arrow_back_ios))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              Text(
                SGBVscreenConstantsE.text.tr,
                style: CustomTextStyles.descriptionTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

