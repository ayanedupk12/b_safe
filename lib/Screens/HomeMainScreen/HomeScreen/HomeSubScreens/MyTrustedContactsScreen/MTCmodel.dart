import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String id; // Add the 'id' field
  String name;
  String phoneNumber;

  ContactModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  // Convert ContactModel to a Map<String, dynamic> for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  // Create a ContactModel instance from a Map<String, dynamic>
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }

  // Create a ContactModel instance from a DocumentSnapshot
  factory ContactModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return ContactModel(
      id: doc.id,
      name: doc.data()!['name'],
      phoneNumber: doc.data()!['phoneNumber'],
    );
  }
}
