import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/TypesOfSupportScreen/TOSWidget.dart';
import 'package:b_safe/Utils/AppConstants/English/TypesOfSupportScreenConstantsE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Utils/Colors.dart';
import '../../../../../../Utils/Textstyles.dart';
import '../../../../../Routs/RoutsNames.dart';
import '../../../HomeMainScreen.dart';

class TypeOfSupportScreen extends StatelessWidget {
  const TypeOfSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          TOSscreenConstantsE.appBarTitle.tr,
          style: CustomTextStyles.appBarTextStyle,
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
              size(),
              Text(
                TOSscreenConstantsE.mainTitle.tr,
                style: CustomTextStyles.topicTextStyle,
              ),
             size(),
             TOSWidget(title: TOSscreenConstantsE.title1.tr, description: TOSscreenConstantsE.description1.tr),
             TOSWidget(title: TOSscreenConstantsE.title2.tr, description: TOSscreenConstantsE.description2.tr),
             TOSWidget(title: TOSscreenConstantsE.title3.tr, description: TOSscreenConstantsE.description3.tr),
             TOSWidget(title: TOSscreenConstantsE.title4.tr, description: TOSscreenConstantsE.description4.tr),
              size(),
              size(),
            ],
          ),
        ),
      ),
    );
  }
}


size(){
  return const SizedBox(height: 10,);
}