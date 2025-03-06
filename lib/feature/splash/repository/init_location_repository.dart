import 'package:quran/core/repositories/location_response_model.dart';
import 'package:quran/core/services/location_service.dart';

abstract class InitLocationRepository {
  Future<LocationResponseModel> getCurrentLocation();
}

class InitLocationRepositoryImpl implements InitLocationRepository {
  final LocationService _locationService;

  InitLocationRepositoryImpl({required LocationService locationService})
    : _locationService = locationService;

  @override
  Future<LocationResponseModel> getCurrentLocation() async {
    try {
      final result = await _locationService.getCurrentLocation();
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  factory InitLocationRepositoryImpl.create() {
    return InitLocationRepositoryImpl(
      locationService: LocationServiceImpl.create(),
    );
  }
}
