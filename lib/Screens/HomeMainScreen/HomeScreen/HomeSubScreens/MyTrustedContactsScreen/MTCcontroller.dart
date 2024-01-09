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
          ContactModel newContact = ContactModel(
            name: name.text,
            phoneNumber: phoneNumber, id: DateTime.now().toString(),
          );

          // Convert ContactModel to Map for Firestore
          Map<String, dynamic> contactData = newContact.toJson();

          // Add contact data to Firestore
          await FirebaseFirestore.instance
              .collection("User")
              .doc(user.uid)
              .collection('contacts')
              .add(contactData);

          // Fetch updated contacts after adding new contact
          await fetchContacts();

          // Clear fields and update UI
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
    loading = true;
    update();

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("User")
            .doc(user.uid)
            .collection('contacts')
            .get();

        if (querySnapshot.docs.isEmpty) {
          print('No contacts found');
          contactModelList = [];
          loading = false;
          update();
          showMessage("No contacts found");
        } else {
          List<ContactModel> contacts = querySnapshot.docs.map((doc) {
            return ContactModel.fromDocumentSnapshot(doc);
          }).toList();

          contactModelList = contacts;
          update();

          contacts.forEach((contact) {
            print('Name: ${contact.name}, Phone Number: ${contact.phoneNumber}');
          });
        }
      } else {
        print("User not authenticated");
        showMessage("User not authenticated");
      }
    } catch (e) {
      print("Error fetching contacts: $e");
      showMessage("Error fetching contacts: $e");
    }

    loading = false;
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

        // Fetch updated contacts after deleting
        await fetchContacts();
      } else {
        print("User not authenticated");
        showMessage("User not authenticated");
      }
    } catch (e) {
      print("Error deleting contact: $e");
      showMessage("Error deleting contact: $e");
    }
  }

  Future<void> editContact(String contactId) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String phoneNumber = newPhone.text.trim();

        // Regular expression for a valid 11-digit phone number
        RegExp phoneNumberRegExp = RegExp(r'^[0-9]{11}$');

        // Check if the phone number format is valid
        if (phoneNumberRegExp.hasMatch(phoneNumber)) {
          DocumentReference contactRef = FirebaseFirestore.instance
              .collection("User")
              .doc(user.uid)
              .collection('contacts')
              .doc(contactId);

          await contactRef.update({
            'name': newName.text,
            'phoneNumber': phoneNumber,
          });

          // Fetch updated contacts after editing
          await fetchContacts();
          update();
        } else {
          print("Invalid phone number format");
          showMessage("Invalid phone number format");
        }
      } else {
        print("User not authenticated");
        showMessage("User not authenticated");
      }
    } catch (e) {
      print("Error editing contact: $e");
      showMessage("Error editing contact: $e");
    }
  }
  
}




