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
}

class PrayRepositoryImpl implements PrayRepository {
  final ApiService _apiService;

  PrayRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

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

  factory PrayRepositoryImpl.create() {
    return PrayRepositoryImpl(apiService: ApiServiceImpl.create());
  }
}
