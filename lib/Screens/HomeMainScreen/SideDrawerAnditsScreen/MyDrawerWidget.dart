import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/GlobalWidget/DropDownField.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/IconsPaths.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/AppConstants/English/LanguageAndCountrySelectionConstantsE.dart';
import '../../../Utils/AppConstants/English/SideDrawerConstantsE.dart';
import 'DrawerScreen/AboutBesafeScreen.dart';
import 'DrawerScreen/PrivacyPolicyScreen.dart';
import 'DrawerScreen/SafetyAdviceScreen.dart';
import 'DrawerScreen/TermsAndConditionScreen.dart';
import 'SideDrawerAnditsScreenController.dart';

class MyDrawerWidget extends StatelessWidget {
  MyDrawerWidget({super.key});

  final SideDrewerController sideDrewerController =Get.put(SideDrewerController());

  final GlobalController globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/logo.png';
    return GetBuilder<SideDrewerController>(
      builder: (__) {
        return Drawer(
          backgroundColor: const Color(0xffF4F7FA),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * .02,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height5(),

                  ///logo///////
                  Center(
                    child: Hero(
                      tag: image,
                      child: Image.asset(
                        image,
                        height: 70,
                      ),
                    ),
                  ),
                  height2(),

                  ///Call Police/////////////
                  DrawerSubWidget(
                    iconPath: AppIcons.callicon,
                    title: SideDrawerConstantsE.policeButton.tr,
                    onTap: () async {
                      globalController.callPolice();
                    },
                  ),

                  ///Safety Advice////////////
                  DrawerSubWidget(
                    onTap: () {
                      Get.to(SafetyAdviceScreen(
                        appBartext: SideDrawerConstantsE.safetyButton.tr,
                      ));
                    },
                    iconPath: AppIcons.safetyadviceicon,
                    title: SideDrawerConstantsE.safetyButton.tr,
                  ),

                  ///About Bsafe/////////////
                  DrawerSubWidget(
                    iconPath: AppIcons.abouticon,
                    title: SideDrawerConstantsE.aboutbutton.tr,
                    onTap: () {
                      Get.to(AboutBeSafeScreen(
                        image: image,
                        appBarText: SideDrawerConstantsE.aboutbutton.tr,
                      ));
                    },
                  ),

                  ///Privacy Policy///////////
                  DrawerSubWidget(
                    iconPath: AppIcons.privacypolicyicon,
                    title: SideDrawerConstantsE.privacybutton.tr,
                    onTap: () {
                      Get.to(PrivacyPolicyScreen(
                        image: image,
                        appBarText: SideDrawerConstantsE.privacybutton.tr,
                      ));
                    },
                  ),

                  ///Terms & Condition/////////
                  DrawerSubWidget(
                    iconPath: AppIcons.termsandconditionsicon,
                    title: SideDrawerConstantsE.tandCbutton.tr,
                    onTap: () {
                      Get.to(TermsAndConditionScreen(
                        appBarText: SideDrawerConstantsE.tandCbutton.tr,
                      ));
                    },
                  ),
                  height2(),

                  ///setting text ///
                  Text(
                    SideDrawerConstantsE.seetingText.tr,
                    style: CustomTextStyles.logoStyle,
                  ),
                  height2(),

                  ///security Mode////
                  SizedBox(
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: const Icon(
                          Icons.sunny,
                          color: Color(0xffFED400),
                        ),
                        title: Text(
                          SideDrawerConstantsE.securitybutton.tr,
                          style: CustomTextStyles.buttonTextStyleB,
                        ),
                        trailing: Transform.scale(
                          scale: .8,
                          child: CupertinoSwitch(
                            value: globalController.val,
                            activeColor: Colors.grey,
                            onChanged: (value) {
                             globalController.updateSwitch(value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///Choose language//////
                  SizedBox(
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset(
                          AppIcons.languageicon,
                          color: AppColors.main2Coclor,
                          height: 25,
                        ),
                        title: CustomDropdownFormField(
                          onChange: (val) {
                            print(val);
                          },
                          text: SideDrawerConstantsE.chooseLan.tr,
                          actionsList: [
                            LCscreenConstantsE.english.tr,
                            LCscreenConstantsE.polish.tr,
                            LCscreenConstantsE.czcechL.tr,
                            LCscreenConstantsE.slovak.tr,
                            LCscreenConstantsE.ukrain.tr,
                          ],
                          width: Get.width,
                          height: Get.height * .05,
                        ),
                      ),
                    ),
                  ),

                  ///Choose country///
                  SizedBox(
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.language,
                          color: AppColors.main2Coclor,
                          size: 25,
                        ),
                        title: CustomDropdownFormField(
                          width: Get.width,
                          height: Get.height * .05,
                          text: SideDrawerConstantsE.chooseContry.tr,
                          actionsList: [
                            LCscreenConstantsE.poland.tr,
                            LCscreenConstantsE.zcechC.tr,
                            LCscreenConstantsE.slovakia.tr,
                          ],
                          onChange: (val) {
                            print(val);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

height2() {
  return SizedBox(
    height: Get.height * .02,
  );
}

height5() {
  return SizedBox(
    height: Get.height * .05,
  );
}

class DrawerSubWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final Widget? trailing;
  final GestureTapCallback? onTap;
  const DrawerSubWidget(
      {super.key,
      this.trailing,
      required this.iconPath,
      required this.title,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: ListTile(
          onTap: onTap,
          leading: Image.asset(
            iconPath,
            color: AppColors.main2Coclor,
            height: 25,
          ),
          title: Text(
            title,
            style: CustomTextStyles.buttonTextStyleB,
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
