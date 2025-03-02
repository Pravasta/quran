import 'package:quran/core/repositories/list_surah_response_model.dart';
import 'package:quran/core/services/api_service.dart';

abstract class HomeRepository {
  Future<List<Surah>> getListSurah();
}

class HomeRepositoryImpl implements HomeRepository {
  final ApiService _apiService;

  HomeRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<List<Surah>> getListSurah() async {
    try {
      final result = await _apiService.getListSurah();
      return result.data ?? [];
    } catch (e) {
      throw e.toString();
    }
  }

  factory HomeRepositoryImpl.create() {
    return HomeRepositoryImpl(apiService: ApiServiceImpl.create());
  }
}
