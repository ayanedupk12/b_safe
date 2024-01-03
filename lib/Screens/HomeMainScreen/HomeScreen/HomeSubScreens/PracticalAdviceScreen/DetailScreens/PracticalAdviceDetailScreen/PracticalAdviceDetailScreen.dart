import 'package:b_safe/Utils/AppConstants/English/PracticalAdviceConstantsE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Routs/RoutsNames.dart';
import '../../../../../../../Utils/Colors.dart';
import '../../../../../../../Utils/Textstyles.dart';
import '../../../../../HomeMainScreen.dart';
import 'PADSWidget.dart';

class PracticalAdviceDetailScreen extends StatelessWidget {
  final String appBarText;
  const PracticalAdviceDetailScreen({super.key, required this.appBarText});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          appBarText.tr,
          style: CustomTextStyles.logoStyle.copyWith(fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Get.toNamed(RouteNames.practicalAdviceScreen);
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
              SizedBox(height: 10,),
              Text(
                PracTicalAdviceConstantsE.mainTitleE,
                style: CustomTextStyles.topicTextStyle,
              ),
              PADSWidget(title: PracTicalAdviceConstantsE.titleE1.tr, description: PracTicalAdviceConstantsE.descriptionE1.tr,),
              PADSWidget(title: PracTicalAdviceConstantsE.titleE2.tr, description: PracTicalAdviceConstantsE.descriptionE2.tr,),
              PADSWidget(title: PracTicalAdviceConstantsE.titleE3.tr, description: PracTicalAdviceConstantsE.descriptionE3.tr,),
              PADSWidget(title: PracTicalAdviceConstantsE.titleE4.tr, description: PracTicalAdviceConstantsE.descriptionE4.tr,),
              PADSWidget(title: PracTicalAdviceConstantsE.titleE5.tr, description: PracTicalAdviceConstantsE.descriptionE5.tr,),
              PADSWidget(title: PracTicalAdviceConstantsE.titleE6.tr, description: PracTicalAdviceConstantsE.descriptionE5.tr,),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

