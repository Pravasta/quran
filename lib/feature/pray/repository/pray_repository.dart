import 'package:quran/core/local_storage/shared_pref_service.dart';
import 'package:quran/core/repositories/get_code_location_response_model.dart';
import 'package:quran/core/repositories/get_jadwal_sholat_response_model.dart';
import 'package:quran/core/services/api_service/api_service.dart';

abstract class PrayRepository {
  Future<List<Lokasi>> getCodeLocation(String location);
  Future<Data> getJadwalByLocation(
    String code,
    int tahun,
    int bulan,
    int tanggal,
  );
  Future<void> setSharedPref(String key, String value);
  Future<String?> getSharedPref(String key);
  Future<void> removeSharedPref(String key);
}

class PrayRepositoryImpl implements PrayRepository {
  final ApiService _apiService;
  final SharedPrefService _prefService;

  PrayRepositoryImpl({
    required ApiService apiService,
    required SharedPrefService prefService,
  }) : _apiService = apiService,
       _prefService = prefService;

  @override
  Future<List<Lokasi>> getCodeLocation(String location) async {
    try {
      final result = await _apiService.getCodeLocation(location);
      return result.data ?? [];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<Data> getJadwalByLocation(
    String code,
    int tahun,
    int bulan,
    int tanggal,
  ) async {
    try {
      final result = await _apiService.getJadwalSholat(
        code,
        tahun,
        bulan,
        tanggal,
      );
      return result.data ?? Data();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<String?> getSharedPref(String key) async {
    try {
      final result = await _prefService.getSharedPref(key);
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> removeSharedPref(String key) async {
    try {
      await _prefService.removeSharedPref(key);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> setSharedPref(String key, String value) async {
    try {
      await _prefService.setSharedPref(key, value);
    } catch (e) {
      throw e.toString();
    }
  }

  factory PrayRepositoryImpl.create() {
    return PrayRepositoryImpl(
      apiService: ApiServiceImpl.create(),
      prefService: SharedPrefServiceImpl.create(),
    );
  }
}
