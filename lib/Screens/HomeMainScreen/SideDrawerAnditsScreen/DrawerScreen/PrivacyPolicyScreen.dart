import 'package:b_safe/Utils/AppConstants/English/PrivacyPolicyScreenConstantsE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/Colors.dart';
import '../../../../Utils/Textstyles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final String image;
  final String appBarText;
  const PrivacyPolicyScreen({super.key, required this.image, required this.appBarText});

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
              Get.back();
            },
            icon: const Center(child: Icon(Icons.arrow_back_ios))),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: Get.width * .05
        ),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text(PrivacyPolicyConstantsE.text1.tr,style: CustomTextStyles.descriptionTextStyle),
                size(),
                Text(PrivacyPolicyConstantsE.text2.tr,style: CustomTextStyles.descriptionTextStyle),
                size(),
                Text(PrivacyPolicyConstantsE.text3.tr,style: CustomTextStyles.descriptionTextStyle),
                size(),
                size(),
                size(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
size(){
  return const SizedBox(height: 15,);
}
