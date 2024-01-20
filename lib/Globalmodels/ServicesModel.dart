

class LocationServices {
  String name;
  String country;
  double latitude;
  double longitude;

  LocationServices({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory LocationServices.fromJson(Map<String, dynamic> json) {
    return LocationServices(
      name: json['name'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}