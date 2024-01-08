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
  List<ContactModel> contactModelList = [];
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController newName = TextEditingController();
  final TextEditingController newPhone = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  Future<void> addContact() async {
    loading = true;
    update();
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String phoneNumber = phone.text.trim();
        if (name.text.isEmpty) {
          name.text = 'Add Name'; // Set default text if name is empty
        }

        // Regular expression for a valid 11-digit phone number
        RegExp phoneNumberRegExp = RegExp(r'^[0-9]{11}$');
        if (phoneNumber.isNotEmpty && phoneNumberRegExp.hasMatch(phoneNumber)) {
          // Ensure phone is not empty and matches the 11-digit format
          await FirebaseFirestore.instance
              .collection("User")
              .doc(user.uid)
              .collection('contacts')
              .add({
            'name': name.text,
            'phoneNumber': phoneNumber,
          });

          await fetchContacts();
          loading = false;
          update();
          Get.back();
          name.clear();
          phone.clear();
        } else {
          showMessage("Enter a valid 11-digit phone number");
          loading = false;
          update();
        }
      } else {
        print("User not authenticated");
        showMessage("User not authenticated");
        loading = false;
        update();
      }
    } catch (e) {
      // Handle any errors that occur during the Firestore write operation
      print("Error adding contact: $e");
      showMessage("Error adding contact: $e");
      loading = false;
      update();
    }
    update();
  }

  Future<void> fetchContacts() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
            .collection("User")
            .doc(user.uid)
            .collection('contacts')
            .get();

        List<ContactModel> contacts = querySnapshot.docs.map((doc) {
          return ContactModel.fromJson(doc.data());
        }).toList();

        // Assign fetched contacts to contactModelList
        contactModelList = contacts; // Populate contactModelList with fetched data
        update();

        // Print contact details
        contacts.forEach((contact) {
          print('Name: ${contact.name}, Phone Number: ${contact.phoneNumber}');
        });

        // Notify listeners about the change in contactModelList
        update();
      } else {
        print("User not authenticated");
      }
    } catch (e) {
      print("Error fetching contacts: $e");
    }
    update();
  }

  Future<void> deleteContact(String contactId) async {
  try {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
  await FirebaseFirestore.instance
      .collection("User")
      .doc(user.uid)
      .collection('contacts')
      .doc(contactId)
      .delete();

  await fetchContacts();
  update();
  } else {
  print("User not authenticated");
  showMessage("User not authenticated");
  }
  } catch (e) {
  print("Error deleting contact: $e");
  showMessage("Error deleting contact: $e");
  }
  }

}




