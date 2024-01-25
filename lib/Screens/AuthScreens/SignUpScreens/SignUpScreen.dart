import 'package:b_safe/Screens/AuthScreens/SignUpScreens/SignUpController.dart';
import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:b_safe/Utils/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalWidget/MyButton.dart';
import '../../../GlobalWidget/MyTextField.dart';
import '../../../Routs/RoutsNames.dart';
import '../../../Utils/AppConstants/CzechConstants.dart';
import '../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../Utils/Colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (__) {
      return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            LoginSignUpConstantsE.signUpText.tr,
            style: CustomTextStyles.appBarTextStyle,
          ),
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(RouteNames.loginScreen);
              },
              icon: Center(child: Icon(Icons.arrow_back_ios))),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height5(),
                Center(
                  child: Image.asset(
                    ImagesPaths.logoG,
                    height: 100,
                  ),
                ),
                height5(),
                Center(
                  child: Text(
                    LoginSignUpConstantsE.welcomText.tr,
                    style: CustomTextStyles.appBarTextStyle,
                  ),
                ),
                height5(),
                Text(
                  LoginSignUpConstantsE.emailText.tr,
                  style: CustomTextStyles.descriptionTextStyleB,
                ),
                MyTextField(
                  controller: __.sEmail,
                  height: Get.height * .06,
                  prefixIcon: const Icon(Icons.email_rounded),
                  hintText: 'Lorem@gmail.com',
                ),
                height2(),
                Text(
                  LoginSignUpConstantsE.passwordText.tr,
                  style: CustomTextStyles.descriptionTextStyleB,
                ),
                MyTextField(
                  controller: __.sPassword,
                  obSecure: __.isPasswordObscured,
                  height: Get.height * .06,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      __.togglePasswordVisibility();
                    },
                    child: Icon(__.isPasswordObscured?Icons.visibility:Icons.visibility_off),
                  ),
                  hintText: 'Alex1234567',
                ),
                height2(),
                Text(
                  "Confirm Password",
                  style: CustomTextStyles.descriptionTextStyleB,
                ),
                MyTextField(
                  controller: __.cPassword,
                  obSecure: __.isConfirmPasswordObscured,
                  height: Get.height * .06,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      __.toggleConfirmPasswordVisibility();
                    },
                    child: Icon(__.isConfirmPasswordObscured?Icons.visibility:Icons.visibility_off),
                  ),
                  hintText: 'Alex1234567',
                ),
                height5(),
                height5(),
                MyButton(
                  loading: __.isLoading,
                  borderRadios: 5,
                  height: Get.height * .05,
                  onPress: () {
                   __.confirmEmailAndCreateUser();
                  },
                  title: LoginSignUpConstantsE.signUpText.trim().tr,
                ),
                height2(),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.offAllNamed(RouteNames.loginScreen);
                    },
                    child: RichText(
                      text: TextSpan(
                          text: LoginSignUpConstantsE.alreadyHaveAccountText.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: LoginSignUpConstantsE.loginText.trim().tr,
                              style: CustomTextStyles.topicTextStyle
                                  .copyWith(color: AppColors.main2Coclor),
                            )
                          ]),
                    ),
                  ),
                ),
                height5(),
                height5(),
              ],
            ),
          ),
        ),
      );
    });
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
