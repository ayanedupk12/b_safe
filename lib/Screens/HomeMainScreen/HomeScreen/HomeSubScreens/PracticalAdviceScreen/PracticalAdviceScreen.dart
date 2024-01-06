import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:flutter/material.dart';
import '../../../../../Routs/RoutsNames.dart';
import '../../../../../Utils/AppConstants/English/PracticalAdviceConstantsE.dart';
import '../../../../../Utils/Colors.dart';
import 'package:get/get.dart';
import '../../../../../Utils/Textstyles.dart';
import 'DetailScreens/PracticalAdviceDetailScreen/PracticalAdviceDetailScreen.dart';
import 'DetailScreens/SGBVDifferentFormsDetailScreen/SGBVDifferentFormsDetailScreen.dart';
import 'DetailScreens/SexualGenderVoilenceScreen/SexualGenderVoilenceScreen.dart';
import 'PAscreenWidget.dart';

class PracticalAdviceScreen extends StatelessWidget {
  const PracticalAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          PractivcalAdvsMainConstantsE.appBarText.tr,
          style: CustomTextStyles.logoStyle.copyWith(fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RouteNames.homeMainScreen);
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
              Text(
                PractivcalAdvsMainConstantsE.mainTitle.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              PAscreenWidget(
                onTap: () {
                  Get.toNamed(RouteNames.sexualGenderVoilenceScreen);
                },
                text: PractivcalAdvsMainConstantsE.sexualgebdebaseButontext.tr,
                image: ImagesPaths.practicalAdviceImage1,
              ),
              PAscreenWidget(
                onTap: () {
                  Get.toNamed(RouteNames.sGBVDifferentFormsDetailScreen);
                },
                text: PractivcalAdvsMainConstantsE.SGBVformButontext.tr,
                image: ImagesPaths.practicalAdviceImage2,
              ),
              PAscreenWidget(
                onTap: () {
                  Get.toNamed(RouteNames.practicalAdviceDetailScreen);
                },
                text: PractivcalAdvsMainConstantsE.appBarText.tr,
                image: ImagesPaths.practicalAdviceImage3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


