import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Routs/RoutsNames.dart';
import '../../../../../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../../../../../Utils/Colors.dart';
import '../../../../../../../Utils/Textstyles.dart';
import 'SGBVWidget.dart';

class SGBVDifferentFormsDetailScreen extends StatelessWidget {
  const SGBVDifferentFormsDetailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          PractivcalAdvsMainConstantsE.SGBVformButontext.tr,
          style: CustomTextStyles.appBarTextStyle,
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
              const SizedBox(height: 10,),
              Text(
                SGBVFormsConstantsE.SGBVencompasses.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
              const SizedBox(height: 10,),
               SGBVWidget(title: SGBVFormsConstantsE.sexualVoilence.tr, description: SGBVFormsConstantsE.sexualVoilenceDes.tr,),
               SGBVWidget(title: SGBVFormsConstantsE.domesticVoilence.tr, description: SGBVFormsConstantsE.domesticVoilenceDes.tr,),
               SGBVWidget(title: SGBVFormsConstantsE.genderBVoilence.tr, description: SGBVFormsConstantsE.genderBVoilencedDes.tr,),
               SGBVWidget(title: SGBVFormsConstantsE.harmfulTradition.tr, description: SGBVFormsConstantsE.harmfulTraditionDes.tr,),
               SGBVWidget(title: SGBVFormsConstantsE.descrimination.tr, description: SGBVFormsConstantsE.descriminationDes.tr,),

            ],
          ),
        ),
      ),
    );
  }
}







