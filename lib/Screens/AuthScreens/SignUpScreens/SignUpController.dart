import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Utils/Colors.dart';

class SignUpController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;


  bool isLoading = false;
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    update();
  }
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscured = !isConfirmPasswordObscured;
    update();
  }

  final TextEditingController sEmail = TextEditingController();
  final TextEditingController sPassword = TextEditingController();
  final TextEditingController cPassword = TextEditingController();



  Future<void> confirmEmailAndCreateUser() async {
    isLoading = true;
    update();

    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );

    if (!emailRegex.hasMatch(sEmail.text)) {
      isLoading = false;
      update();
      showMessage('Please enter a valid email address.');
      return;
    }

    try {
      if (sPassword.text != cPassword.text) {
        if (kDebugMode) {
          print('Passwords do not match.');
        }
        showMessage('Passwords do not match. Please make sure your passwords match.');
        isLoading = false;
        update();
        return;
      }

      // Password must have at least one letter, at least one digit, and be at least 6 characters long.
      RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
      if (!passwordRegExp.hasMatch(sPassword.text)) {
        if (kDebugMode) {
          print('Invalid password. Please use a stronger password.');
        }
        showMessage('Password must contain at least one letter, one digit, and be at least 6 characters long.');
        isLoading = false;
        update();
        return;
      }

      var methods = await _auth.fetchSignInMethodsForEmail(sEmail.text);

      if (methods.isNotEmpty) {
        showMessage('An account already exists for that email. Please log in or use a different email to create a new account.');
      } else {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: sEmail.text,
          password: sPassword.text,
        );

        if (userCredential.user != null) {
          showMessage('Account created successfully. Welcome!');
          isLoading = false;
          sEmail.clear();
          sPassword.clear();
          update();
          Get.offAllNamed(RouteNames.homeMainScreen);
        } else {
          showMessage('Failed to create account. Please try again.');
          isLoading = false;
          update();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading = false;
        update();
        showMessage('Please use a stronger password.');
      } else if (e.code == 'email-already-in-use') {
        Get.offAllNamed(RouteNames.loginScreen);
        showMessage('An account already exists for that email. Please log in or use a different email to create a new account.');
        isLoading = false;
        update();
      } else {
        showMessage('Something went wrong. Please try again later.');
        isLoading = false;
        update();
      }
    } catch (e) {
      showMessage('An unexpected error occurred. Please try again later.');
    } finally {
      isLoading = false;
      update();
    }
  }




}
