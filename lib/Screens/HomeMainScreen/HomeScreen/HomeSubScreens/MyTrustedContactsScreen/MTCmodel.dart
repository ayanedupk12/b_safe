class ContactModel {
  String name;
  String phoneNumber;

  ContactModel({
    required this.name,
    required this.phoneNumber,
  });

  // Convert ContactModel to a Map<String, dynamic> for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  // Create a ContactModel instance from a Map<String, dynamic>
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }
}

