class ContactModel {
  String name;
  String phoneNumber;

  ContactModel({required this.name, required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
