

import 'package:b_safe/Utils/AppConstants/English/AboutConstantsE.dart';
import 'package:b_safe/Utils/IconsPaths.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/Colors.dart';
import '../../../../Utils/Textstyles.dart';
import '../../HomeMainScreen.dart';

class AboutBeSafeScreen extends StatelessWidget {
  final String image;
  final String appBarText;
  const AboutBeSafeScreen({super.key, required this.image, required this.appBarText});

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
            icon: Center(child: Icon(Icons.arrow_back_ios))),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: Get.width * .05
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              AboutScreenWidget(description: AboutConstantsE.aboutText.tr,link: AboutConstantsE.aboutLink,),
              SizedBox(height: 20,),
              Hero(tag: image,child: Image.asset(image,height: 80,)),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutScreenWidget extends StatelessWidget {
  final String? link;
  final String description;
  const AboutScreenWidget(
      {super.key,
        required this.description,
        this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: RichText(
          text: TextSpan(
              text: '',
              style: Theme.of(context).textTheme.displayMedium,
              children: [
                TextSpan(text: description, style: CustomTextStyles.descriptionTextStyle),
                TextSpan(
                  text: link,
                  style: CustomTextStyles.buttonTextStyleB
                      .copyWith(color: Color(0xff009FFF)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Text span tapped!');
                    },
                ),
              ])),
    );
  }
}
