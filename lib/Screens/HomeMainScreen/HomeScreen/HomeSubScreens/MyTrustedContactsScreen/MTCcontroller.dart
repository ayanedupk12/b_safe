import 'package:b_safe/Utils/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'MTCmodel.dart';

class MTCcontroller extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool loading = false;

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();

  void addContact() async {
    loading = true;
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("User")
            .doc(user.uid)
            .collection('contacts')
            .add({
          'name': name.text,
          'phoneNumber': phone.text,
        });
        loading = false;
        // Clear text fields after successful addition
        name.clear();
        phone.clear();
        // Show a success message or perform any necessary action
      } else {
        // Handle case when user is not logged in
        print("User not authenticated");
        showMessage("User not authenticated");
        loading = false;
      }
    } catch (e) {
      // Handle any errors that occur during the Firestore write operation
      print("Error adding contact: $e");
      showMessage("Error adding contact: $e");
      loading = false;
    }
  }
}
