import 'package:b_safe/Routs/RoutsNames.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForGotPasswordController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  final TextEditingController resetPassword=TextEditingController();

  Future<void> sendPasswordResetEmail() async {
    try {
      isLoading = true;
      update();// Set loading state to true while sending email
      await _auth.sendPasswordResetEmail(email: resetPassword.text);
      // The reset password email has been sent successfully
      // You can add any additional logic here, such as showing a success message
      isLoading = false;
      update();
      showMessage("Reset password email sent to ${resetPassword.text} please check your email and reset your password");
      Get.offAllNamed(RouteNames.loginScreen);
    } catch (e) {
      isLoading = false;
      update();
      if (e is FirebaseAuthException) {
        String errorMessage = e.toString();
        switch (e.code) {
          case 'user-not-found':
            showMessage('No user found for ${resetPassword.text} please create an account first.');
            errorMessage = 'No user found for that email.';
            Get.offAllNamed(RouteNames.signUpScreen);
            break;
          case 'invalid-email':
            showMessage('Invalid email address.');
            errorMessage = 'Invalid email address.';
            break;
          default:
            errorMessage = 'Error sending reset password email: ${e.message}';
            showMessage('Error sending reset password email: ${e.message}');
            break;
        }
        // Show error message to the user
        showMessage("Error sending reset password email: ${e.code}");
        print("Error sending reset password email: ${e.code}");
      } else {
        // Handle other types of exceptions or errors
        showMessage("Something Went Wrong");
        print("Error sending reset password email: $e");
      }
    }
    update();
  }

}
