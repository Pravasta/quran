import 'package:quran/core/repositories/get_detail_surah_response_model.dart';
import 'package:quran/core/services/api_service.dart';

abstract class DetailSurahRepository {
  Future<DetailSurah> getDetailSurah(int surahNumber);
}

class DetailSurahRepositoryImpl implements DetailSurahRepository {
  final ApiService _apiService;

  DetailSurahRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<DetailSurah> getDetailSurah(int surahNumber) async {
    try {
      final result = await _apiService.getDetailSurah(surahNumber);
      return result.data ?? DetailSurah();
    } catch (e) {
      throw e.toString();
    }
  }

  factory DetailSurahRepositoryImpl.create() {
    return DetailSurahRepositoryImpl(apiService: ApiServiceImpl.create());
  }
}
