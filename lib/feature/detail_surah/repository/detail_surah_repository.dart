import 'package:quran/core/network/network_helper.dart';
import 'package:quran/core/repositories/get_detail_surah_response_model.dart';
import 'package:quran/core/services/api_service/api_local_service.dart';
import 'package:quran/core/services/api_service/api_service.dart';
import 'package:quran/core/services/save_ayat/save_ayat_local.dart';
import 'package:quran/core/services/save_ayat/save_ayat_model.dart';

abstract class DetailSurahRepository {
  Future<DetailSurah> getDetailSurah(int surahNumber);
  Future<String> addLastRead(SaveAyatModel data);
}

class DetailSurahRepositoryImpl implements DetailSurahRepository {
  final ApiService _apiService;
  final NetworkHelper _helper;
  final ApiLocalService _apiLocalService;
  final SaveAyatLocal _saveAyatLocal;

  DetailSurahRepositoryImpl({
    required ApiService apiService,
    required NetworkHelper helper,
    required ApiLocalService apiLocalService,
    required SaveAyatLocal saveAyatLocal,
  }) : _apiService = apiService,
       _helper = helper,
       _apiLocalService = apiLocalService,
       _saveAyatLocal = saveAyatLocal;

  @override
  Future<DetailSurah> getDetailSurah(int surahNumber) async {
    try {
      final isConnected = await _helper.isConnected();
      if (isConnected) {
        final result = await _apiService.getDetailSurah(surahNumber);
        await _apiLocalService.addDetailSurahToLocal(
          result.data ?? DetailSurah(),
        );
        return result.data ?? DetailSurah();
      } else {
        final result = await _apiLocalService.getDetailSurahFromLocal(
          surahNumber,
        );
        return result;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<String> addLastRead(SaveAyatModel data) async {
    try {
      final result = await _saveAyatLocal.updateAyatLastRead(data);
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  factory DetailSurahRepositoryImpl.create() {
    return DetailSurahRepositoryImpl(
      apiService: ApiServiceImpl.create(),
      helper: NetworkHelperImpl.create(),
      apiLocalService: ApiLocalServiceImpl(),
      saveAyatLocal: SaveAyatLocal(),
    );
  }
}
