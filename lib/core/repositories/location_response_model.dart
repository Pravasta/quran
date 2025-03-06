import 'dart:convert';

class LocationResponseModel {
  final double? latitude;
  final double? longitude;
  final String? location;

  LocationResponseModel({this.latitude, this.longitude, this.location});

  factory LocationResponseModel.fromJson(String str) =>
      LocationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationResponseModel.fromMap(Map<String, dynamic> json) =>
      LocationResponseModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
  };
}
