import 'package:b_safe/Screens/AuthScreens/LoginScreen/LogInController.dart';
import 'package:b_safe/Screens/AuthScreens/SignUpScreens/SignUpScreen.dart';
import 'package:b_safe/Utils/ImgesPaths.dart';
import 'package:b_safe/Utils/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalWidget/MyButton.dart';
import '../../../GlobalWidget/MyTextField.dart';
import '../../../Routs/RoutsNames.dart';
import '../../../Utils/Colors.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final LogInController logInController = Get.put(LogInController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      builder: (__) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Log In",
              style: CustomTextStyles.appBarTextStyle,
            ),
            leading: IconButton(
                onPressed: () {
                },
                icon: Center(child: Icon(Icons.arrow_back_ios))),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(ImagesPaths.logoG,height: 100,),
                ),
                height2(),
                Center(
                  child: Text(
                    'Sign In To Continue',
                    style: CustomTextStyles.topicTextStyle,
                  ),
                ),
                height5(),
                Text(
                  'Enter Email',
                  style: CustomTextStyles.buttonTextStyleB,
                ),
                MyTextField(
                  controller: __.logEmail,
                  height: Get.height * .06,
                  prefixIcon: const Icon(Icons.email_rounded),
                  hintText: 'Lorem@gmail.com',
                ),
                height2(),
                Text(
                  'Enter Password',
                  style: CustomTextStyles.buttonTextStyleB,
                ),
                MyTextField(
                  controller: __.logPassword,
                  obSecure: true,
                  height: Get.height * .06,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(Icons.remove_red_eye),
                  ),
                  hintText: '1234567',
                ),
                height2(),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {

                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                      style: CustomTextStyles.topicTextStyle.copyWith(color: AppColors.main2Coclor),
                    ),
                  ),
                ),
                height5(),
                MyButton(
                  borderRadios: 5,
                  height: Get.height * .05,
                  onPress: () {
                    __.loginUserWithEmailAndPassword();
                  },
                  title:"LogIn",
                ),
                height2(),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: CustomTextStyles.topicTextStyle.copyWith(color: AppColors.main2Coclor),
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
