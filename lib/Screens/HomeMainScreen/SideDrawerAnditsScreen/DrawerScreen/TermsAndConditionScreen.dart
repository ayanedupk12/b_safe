import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../../Utils/Colors.dart';
import '../../../../Utils/Textstyles.dart';

class TermsAndConditionScreen extends StatelessWidget {
  final String appBarText;
  const TermsAndConditionScreen({super.key, required this.appBarText});

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
          style: CustomTextStyles.appBarTextStyle,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
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
              Text(
                TermANdCondConstantsE.MainTitle.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
               TermsAndConditionScreenWidget(
                  number: '1',
                  title: TermANdCondConstantsE.Title1.tr,
                  description: TermANdCondConstantsE.d1.tr),
               TermsAndConditionScreenWidget(
                  number: '2',
                  title: TermANdCondConstantsE.Title2.tr,
                  description: TermANdCondConstantsE.d2.tr),
               TermsAndConditionScreenWidget(
                  number: '3',
                  title: TermANdCondConstantsE.Title3.tr,
                  description: TermANdCondConstantsE.d3.tr),
               TermsAndConditionScreenWidget(
                  number: '4',
                  title: TermANdCondConstantsE.Title4.tr,
                  description: TermANdCondConstantsE.d4.tr),
               TermsAndConditionScreenWidget(
                  number: '5',
                  title: TermANdCondConstantsE.Title5.tr,
                  description: TermANdCondConstantsE.d5.tr),
               TermsAndConditionScreenWidget(
                  number: '6',
                  title: TermANdCondConstantsE.Title6.tr,
                  description: TermANdCondConstantsE.d6.tr),
               TermsAndConditionScreenWidget(
                number: '7',
                title: TermANdCondConstantsE.Title7.tr,
                description: TermANdCondConstantsE.d7.tr,
                link: "projectbsafe@hotmail.com",
                 onTap: (){
                  print('Email Tapped');
                 },
              ),
               TermsAndConditionScreenWidget(
                  number: '8',
                  title: TermANdCondConstantsE.Title8.tr,
                  description: TermANdCondConstantsE.d8.tr,),
               TermsAndConditionScreenWidget(
                  number: '9',
                  title: TermANdCondConstantsE.Title9.tr,
                  description: TermANdCondConstantsE.d9.tr),
               TermsAndConditionScreenWidget(
                  number: '10',
                  title: TermANdCondConstantsE.Title10.tr,
                  description: TermANdCondConstantsE.d10.tr),
               SizedBox(
                height: 20,
              ),
              Center(
                  child: Image.asset(
                'assets/images/logo.png',
                height: 100,
              )),
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

class TermsAndConditionScreenWidget extends StatelessWidget {
  final String title;
  final String number;
  final GestureTapCallback? onTap;
  final String? link;
  final String description;
  const TermsAndConditionScreenWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.number,
      this.link,
      this.onTap,

      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: RichText(
          text: TextSpan(
              text: '',
              style: Theme.of(context).textTheme.displayMedium,
              children: [
            TextSpan(text: "${number}. ", style: CustomTextStyles.descriptionTextStyleB),
            TextSpan(text: title, style: CustomTextStyles.descriptionTextStyleB),
            TextSpan(text: ' : ', style: CustomTextStyles.descriptionTextStyleB),
            TextSpan(text: description, style: CustomTextStyles.descriptionTextStyle),
            TextSpan(
              text: link,
              style: CustomTextStyles.buttonTextStyleB
                  .copyWith(color: const Color(0xff009FFF)),
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
            ),
          ])),
    );
  }
}
