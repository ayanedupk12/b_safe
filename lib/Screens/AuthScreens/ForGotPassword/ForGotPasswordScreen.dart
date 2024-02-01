import 'package:b_safe/Screens/AuthScreens/LoginScreen/LogInController.dart';
import 'package:b_safe/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:b_safe/Screens/AuthScreens/SignUpScreens/SignUpScreen.dart';
import 'package:b_safe/Utils/AppConstants/EnglishConstants.dart';
import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:b_safe/Utils/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalWidget/MyButton.dart';
import '../../../GlobalWidget/MyTextField.dart';
import '../../../Routs/RoutsNames.dart';
import '../../../Utils/Colors.dart';
import 'ForGotPasswordController.dart';

class ForGotPasswordScreen extends StatelessWidget {
  ForGotPasswordScreen({super.key});

  final ForGotPasswordController forGotPasswordController = Get.put(ForGotPasswordController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForGotPasswordController>(
        builder: (__) {
          return Scaffold(
            backgroundColor: AppColors.backGroundColor,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                LoginSignUpConstantsE.forgotpassText.tr,
                style: CustomTextStyles.appBarTextStyle,
              ),
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Center(child: Icon(Icons.arrow_back_ios))),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height5(),
                    height5(),
                    Center(
                      child: Image.asset(ImagesPaths.logoG,height: 100,),
                    ),
                    height5(),
                    height5(),
                    Center(
                      child: Text(
                        LoginSignUpConstantsE.forgotpassText.tr,
                        style: CustomTextStyles.appBarTextStyle,
                      ),
                    ),
                    height5(),
                    Text(
                      LoginSignUpConstantsE.enterEmailText.tr,
                      style: CustomTextStyles.descriptionTextStyleB,
                    ),
                    height2(),
                    MyTextField(
                      controller: __.resetPassword,
                      height: Get.height * .06,
                      prefixIcon: const Icon(Icons.email_rounded),
                      hintText: 'Lorem@gmail.com',
                    ),
                    height5(),
                    height5(),
                    MyButton(
                      loading: __.isLoading,
                      borderRadios: 5,
                      height: Get.height * .05,
                      onPress: () {
                        __.sendPasswordResetEmail();
                      },
                      title: LoginSignUpConstantsE.sendResetEmailText.tr,
                    ),
                    height5(),
                    height5(),
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
