import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Utils/Colors.dart';

class LogInController extends GetxController {
  final TextEditingController logEmail = TextEditingController();
  final TextEditingController logPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool loading = false;

  Future<void> loginUserWithEmailAndPassword() async {
    loading = true;
    update();
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: logEmail.text,
        password: logPassword.text,
      );
      loading = false;
      update();

      if (userCredential.user != null) {
        print('User logged in successfully!');
        showMessage('User logged in successfully!');
        Get.to(HomeMainScreen());
        loading = false;
        update();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMessage('No user found for that email.');
        loading = false;
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        //showMessage('Wrong password provided for that user.');
        loading = false;
        print('Wrong password provided for that user.');
      } else {
        print('Error signing in: ${e.message}');
        loading = false;
        showMessage('Error signing in: ${e.message}');
        update();
      }
    } catch (e) {
      print('Error: $e');
      loading = false;
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e);
      showMessage('Error: $e');
      update();
    }
  }
}
