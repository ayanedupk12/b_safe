import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:b_safe/Screens/AuthScreens/LoginScreen/LogInController.dart';
import 'package:b_safe/Utils/AppConstants/UkranianConstants.dart';
import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:b_safe/Utils/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalWidget/MyButton.dart';
import '../../../GlobalWidget/MyTextField.dart';
import '../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../Utils/Colors.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final LogInController logInController = Get.put(LogInController());
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = DateTime.now();
          print("Press back again to exit");
          showMessage("Press back again to exit");
          return false;
        }
        return true;
      },
      child: GetBuilder<LogInController>(builder: (__) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              LoginSignUpConstantsE.loginText.tr,
              style: CustomTextStyles.appBarTextStyle,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height2(),
                  Center(
                    child: Image.asset(
                      ImagesPaths.logoG,
                      height: 100,
                    ),
                  ),
                  height5(),
                  Center(
                    child: Text(
                      LoginSignUpConstantsE.signintocontinueText.tr,
                      style: CustomTextStyles.appBarTextStyle,
                    ),
                  ),
                  height5(),
                  Text(
                    LoginSignUpConstantsE.enterEmailText.tr,
                    style: CustomTextStyles.descriptionTextStyleB,
                  ),
                  MyTextField(
                    controller: __.logEmail,
                    height: Get.height * .06,
                    prefixIcon: const Icon(Icons.email_rounded),
                    hintText: 'Lorem@gmail.com',
                  ),
                  height2(),
                  Text(
                    LoginSignUpConstantsE.enterPasswordText.tr,
                    style: CustomTextStyles.descriptionTextStyleB,
                  ),
                  MyTextField(
                    controller: __.logPassword,
                    obSecure: __.isPasswordObscured,
                    height: Get.height * .06,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        __.togglePasswordVisibility();
                      },
                      child: Icon(__.isPasswordObscured?Icons.visibility:Icons.visibility_off),
                    ),
                    hintText: '1234567',
                  ),
                  height2(),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteNames.forgotPasswordScreen);
                      },
                      child: Text(
                        LoginSignUpConstantsE.forgotpassText.tr,
                        textAlign: TextAlign.end,
                        style: CustomTextStyles.descriptionTextStyleB
                            .copyWith(color: AppColors.main2Coclor),
                      ),
                    ),
                  ),
                  height5(),
                  height5(),
                  MyButton(
                    loading: __.loading,
                    borderRadios: 5,
                    height: Get.height * .05,
                    onPress: () {
                      ///Get.offAllNamed(RouteNames.homeMainScreen);
                      __.loginUserWithEmailAndPassword();
                    },
                    title: LoginSignUpConstantsE.loginText.tr,
                  ),
                  height2(),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteNames.signUpScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                            text: LoginSignUpConstantsE.dontHaveAccountText.tr,
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: LoginSignUpConstantsE.signUpText.tr,
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
      }),
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
