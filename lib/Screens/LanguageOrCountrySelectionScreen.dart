import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/GlobalWidget/MyButton.dart';
import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GlobalWidget/DropDownField.dart';
import '../Utils/AppConstants/English/LanguageAndCountrySelectionConstantsE.dart';

class LanguageOrCountrySelectionScreen extends StatelessWidget {
  const LanguageOrCountrySelectionScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(builder: (__) {
      return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * .1,
            vertical: Get.height * .1,
          ),
          child: Column(
            children: [
              Hero(
                  tag: 'awkyimage',
                  child: Image.asset(
                    'assets/images/logo2.png',
                    height: 50,
                  )),
              SizedBox(
                height: Get.height * .2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * .05,
                  vertical: 30,
                ),
                height: 300,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LCscreenConstantsE.title.tr,
                      style: CustomTextStyles.topicTextStyle,
                    ),
                    CustomDropdownFormField(
                      onChange: (val) {},
                      text: LCscreenConstantsE.countryHintText.tr,
                      actionsList: [
                        LCscreenConstantsE.poland.tr,
                        LCscreenConstantsE.zcechC.tr,
                        LCscreenConstantsE.slovakia.tr,
                      ],
                      width: Get.width,
                      height: Get.height * .07,
                    ),
                    CustomDropdownFormField(
                      onChange: (val) {},
                      text: LCscreenConstantsE.languageHintText.tr,
                      actionsList: [
                        LCscreenConstantsE.english.tr,
                        LCscreenConstantsE.polish.tr,
                        LCscreenConstantsE.czcechL.tr,
                        LCscreenConstantsE.slovak.tr,
                        LCscreenConstantsE.ukrain.tr,
                      ],
                      width: Get.width,
                      height: Get.height * .08,
                    ),
                    MyButton(
                      borderRadios: 5,
                      height: Get.height * .05,
                      onPress: ()  async {
                       __.languageButton();
                      },
                      title: LCscreenConstantsE.buttonText.tr,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
