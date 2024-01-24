import 'package:b_safe/Routs/Routs.dart';
import 'package:b_safe/Routs/RoutsNames.dart';
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
    update();
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
          isLoading=false;
          update();
          Get.offAllNamed(RouteNames.homeMainScreen);
        } else {
          print('Failed to create user.');
          showMessage('Failed to create user.');
          isLoading=false;
          update();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading=false;
        update();
        print('The password provided is too weak.');
        showMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print(e);
        Get.offAllNamed(RouteNames.loginScreen);
        print('The account already exists for that email.');
        showMessage('The account already exists for that email please login to continue.');
        isLoading=false;
        update();
      } else {
        print('Error creating user: ${e.message}');
        showMessage("Something Went Wrong");
        isLoading=false;
        update();
      }
    } catch (e) {
      print('Error: $e');
      showMessage(e.toString());
    } finally {
      isLoading = false;
      sEmail.clear();
      sPassword.clear();
      update();
    }
  }



}
