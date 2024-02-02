

class ServicesModel {
  String name;
  String country;
  double latitude;
  double longitude;
  String website;
  String contact;


  ServicesModel({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.website,
    required this.contact,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      name: json['name'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      website: json['website'],
      contact: json['contact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'website': website,
      'contact': contact,
    };
  }
}