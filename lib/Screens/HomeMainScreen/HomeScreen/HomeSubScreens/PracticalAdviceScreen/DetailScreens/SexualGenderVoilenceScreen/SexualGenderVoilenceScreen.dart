import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../../../../../Utils/Colors.dart';
import '../../../../../../../Utils/Textstyles.dart';

class SexualGenderVoilenceScreen extends StatelessWidget {

  const SexualGenderVoilenceScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        leadingWidth:30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "title",
          style: CustomTextStyles.appBarTextStyle,
          textAlign: TextAlign.center,
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
              // Text(
              //   title.tr,
              //   style: CustomTextStyles.topicTextStyle,
              // ),
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

