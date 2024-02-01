import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Routs/RoutsNames.dart';
import '../../../../../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../../../../../Utils/Colors.dart';
import '../../../../../../../Utils/Textstyles.dart';
import 'PADSWidget.dart';

class PracticalAdviceDetailScreen extends StatelessWidget {
  const PracticalAdviceDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          HomeScreenConstantsE.practicalAdvice.tr,
          style: CustomTextStyles.logoStyle.copyWith(fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RouteNames.practicalAdviceScreen);
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
              SizedBox(
                height: 10,
              ),
              Text(
                PracTicalAdviceConstantsE.mainTitle.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
              PADSWidget(
                title: PracTicalAdviceConstantsE.title1.tr,
                description: PracTicalAdviceConstantsE.description1.tr,
              ),
              PADSWidget(
                title: PracTicalAdviceConstantsE.title2.tr,
                description: PracTicalAdviceConstantsE.description2.tr,
              ),
              PADSWidget(
                title: PracTicalAdviceConstantsE.title3.tr,
                description: PracTicalAdviceConstantsE.description3.tr,
              ),
              PADSWidget(
                title: PracTicalAdviceConstantsE.title4.tr,
                description: PracTicalAdviceConstantsE.description4.tr,
              ),
              PADSWidget(
                title: PracTicalAdviceConstantsE.title5.tr,
                description: PracTicalAdviceConstantsE.description5.tr,
              ),
              PADSWidget(
                title: PracTicalAdviceConstantsE.title6.tr,
                description: PracTicalAdviceConstantsE.description6.tr,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
