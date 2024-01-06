import 'package:b_safe/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:b_safe/Screens/AuthScreens/SignUpScreens/SignUpController.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:b_safe/Utils/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalWidget/MyButton.dart';
import '../../../GlobalWidget/MyTextField.dart';
import '../../../Utils/Colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (__) {
      return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: CustomTextStyles.appBarTextStyle,
          ),
          leading: IconButton(
              onPressed: () {},
              icon: Center(child: Icon(Icons.arrow_back_ios))),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  ImagesPaths.logoG,
                  height: 100,
                ),
              ),
              height2(),
              Center(
                child: Text(
                  'Welcome to BSafe',
                  style: CustomTextStyles.appBarTextStyle,
                ),
              ),
              height5(),
              height5(),
              Text(
                'Email',
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
                'Password',
                style: CustomTextStyles.descriptionTextStyleB,
              ),
              MyTextField(
                controller: __.sPassword,
                obSecure: true,
                height: Get.height * .06,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.remove_red_eye),
                ),
                hintText: 'Alex1234567',
              ),
              height2(),
              height5(),
              height5(),
              MyButton(
                loading: __.isLoading,
                borderRadios: 5,
                height: Get.height * .05,
                onPress: () {
                  Get.to(HomeMainScreen());
                  ///__.confirmEmailAndCreateUser();
                },
                title: "Signup",
              ),
              height2(),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(LogInScreen());
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: CustomTextStyles.topicTextStyle
                                .copyWith(color: AppColors.main2Coclor),
                          )
                        ]),
                  ),
                ),
              ),
              height5(),
            ],
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
