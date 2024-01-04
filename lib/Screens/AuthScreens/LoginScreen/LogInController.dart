

import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Utils/Colors.dart';

class LogInController extends GetxController{
  final TextEditingController logEmail = TextEditingController();
  final TextEditingController logPassword = TextEditingController();
  final FirebaseAuth _auth =FirebaseAuth.instance;

  bool isLoading= false;


  Future<void> loginUserWithEmailAndPassword() async {
    isLoading = true;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: logEmail.text,
        password: logPassword.text,
      );

      if (userCredential.user != null) {
        print('User logged in successfully!');
        showMessage('User logged in successfully!');
        Get.to(HomeMainScreen());
        isLoading = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMessage('No user found for that email.');
        isLoading = false;
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        //showMessage('Wrong password provided for that user.');
        isLoading = false;
        print('Wrong password provided for that user.');
      } else {
        print('Error signing in: ${e.message}');
        isLoading = false;
        showMessage('Error signing in: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
      isLoading = false;
      showMessage('Error: $e');
    }
}
}