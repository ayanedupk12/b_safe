import 'package:b_safe/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Utils/Colors.dart';

class SignUpController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;


  bool isLoading = false;

  final TextEditingController sEmail = TextEditingController();
  final TextEditingController sPassword = TextEditingController();



  Future<void> confirmEmailAndCreateUser() async {
    isLoading = true;
    try {
      var methods = await _auth.fetchSignInMethodsForEmail(sEmail.text);
      if (methods.isNotEmpty) {
        print('The account already exists for that email.');
      } else {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: sEmail.text,
          password: sPassword.text,
        );

        if (userCredential.user != null) {
          print('User created successfully.');
          showMessage('User created successfully.');
          Get.to(HomeMainScreen());
        } else {
          print('Failed to create user.');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print(e);
        Get.to(LogInScreen());
        print('The account already exists for that email.');
      } else {
        print('Error creating user: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      sEmail.clear();
      sPassword.clear();
      update();
    }
  }



}
