import 'package:b_safe/Screens/AuthScreens/LoginScreen/LogInController.dart';
import 'package:b_safe/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:b_safe/Screens/AuthScreens/SignUpScreens/SignUpScreen.dart';
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
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Forgot Password",
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
                      'Forgot password',
                      style: CustomTextStyles.appBarTextStyle,
                    ),
                  ),
                  height5(),
                  Text(
                    'Enter Email',
                    style: CustomTextStyles.descriptionTextStyleB,
                  ),
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
                      ///Get.to(LogInScreen());
                      __.sendPasswordResetEmail();
                    },
                    title:"Send Reset Email",
                  ),
                  height2(),
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
