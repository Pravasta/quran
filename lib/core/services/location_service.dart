import 'dart:io';

import 'package:flutter/services.dart';
import 'package:quran/core/repositories/location_response_model.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

abstract class LocationService {
  Future<LocationResponseModel> getCurrentLocation();
  Future<String> getAddressFromLatLng(double latitude, double longitude);
}

class LocationServiceImpl implements LocationService {
  final Location location;

  double? latitude;
  double? longitude;

  LocationServiceImpl({required this.location});

  @override
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        latitude,
        longitude,
      );
      print('a ${placemarks[0].name.toString()}');
      print('b ${placemarks[0].administrativeArea.toString()}');
      print('c ${placemarks[0].country.toString()}');
      print('d ${placemarks[0].locality.toString()}');
      print('e ${placemarks[0].postalCode.toString()}');
      print('f ${placemarks[0].subAdministrativeArea.toString()}');
      print('g ${placemarks[0].subLocality.toString()}');
      print('h ${placemarks[0].subThoroughfare.toString()}');
      print('i ${placemarks[0].thoroughfare.toString()}');

      // if (placemarks[0].locality == null) {
      //   return placemarks[0].subAdministrativeArea.toString();
      // } else {
      return placemarks[0].subAdministrativeArea.toString();
      // }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<LocationResponseModel> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    String myLocation = '';

    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw 'Location services are disabled.';
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted == PermissionStatus.granted) {
          throw 'Location permissions are denied';
        }
      }

      locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;

      if (latitude != null && longitude != null) {
        myLocation = await getAddressFromLatLng(latitude!, longitude!);
      }

      return LocationResponseModel(
        latitude: latitude,
        longitude: longitude,
        location: myLocation,
      );
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        throw 'Permission denied';
      }
      if (e.code == 'SERVICE_STATUS_ERROR') {
        throw 'Service status error';
      }

      throw 'Unknown error';
    } on SocketException catch (_) {
      throw 'Socket exception';
    } catch (e) {
      throw 'Area not found, please search manually';
    }
  }

  factory LocationServiceImpl.create() {
    return LocationServiceImpl(location: Location());
  }
}
