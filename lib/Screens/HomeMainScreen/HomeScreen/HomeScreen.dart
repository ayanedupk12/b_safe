import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:b_safe/Utils/AppConstants/English/HomeScreenContantsE.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/IconsPaths.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../HomeMainScreenController.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   final GlobalController globalController =Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMainScreenController>(builder: (__) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                HomeScreenContantsE.Text.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
              HomeScreenWidget(
                text: HomeScreenContantsE.button1.tr,
                iconPath: AppIcons.trustedcontactIcon,
                onTap: () {
                  Get.toNamed(RouteNames.myTrustedContactsScreen);
                },
              ),
              HomeScreenWidget(
                text: HomeScreenContantsE.button2.tr,
                iconPath: AppIcons.adviceIcon,
                onTap: () {
                  Get.toNamed(RouteNames.practicalAdviceScreen);
                },
              ),
              HomeScreenWidget(
                text: HomeScreenContantsE.button3.tr,
                iconPath: AppIcons.typeOfSupportIcon,
                onTap: () {
                 Get.toNamed(RouteNames.typeOfSupportScreen);
                },
              ),
              HomeScreenWidget(
                text: HomeScreenContantsE.button4.tr,
                iconPath: AppIcons.bullyingicon,
                onTap: () {
                  Get.toNamed(RouteNames.cyberBullyingAndOnlineSafetyScreen);
                },
              ),
              HomeScreenWidget(
                text: HomeScreenContantsE.button5.tr,
                iconPath: AppIcons.callicon,
                onTap: () {
                  globalController.callPolice();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

class HomeScreenWidget extends StatelessWidget {
  final String? text;
  final String? iconPath;
  final GestureTapCallback? onTap;
  const HomeScreenWidget({super.key, this.text, this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  const EdgeInsets.symmetric(
          vertical: 10
        ),
        child: Card(
          elevation: 2,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.grey,
          child: Center(
            child: ListTile(
              contentPadding: const EdgeInsets.all(5),
              leading: CircleAvatar(
                backgroundColor: AppColors.backGroundColor,
                radius: 30,
                child: Image.asset(
                  iconPath!,
                  height: 30,
                  color: AppColors.main2Coclor,
                ),
              ),
              title: Text(
                text!,
                style: CustomTextStyles.descriptionTextStyleB,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
