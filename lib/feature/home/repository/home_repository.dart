import 'package:quran/core/network/network_helper.dart';
import 'package:quran/core/repositories/list_surah_response_model.dart';
import 'package:quran/core/services/api_service/api_local_service.dart';
import 'package:quran/core/services/api_service/api_service.dart';
import 'package:quran/core/services/save_ayat/save_ayat_local.dart';
import 'package:quran/core/services/save_ayat/save_ayat_model.dart';

abstract class HomeRepository {
  Future<List<Surah>> getListSurah();
  Future<SaveAyatModel> getAyatLastRead();
}

class HomeRepositoryImpl implements HomeRepository {
  final ApiService _apiService;
  final NetworkHelper _helper;
  final ApiLocalService _apiLocalService;
  final SaveAyatLocal _saveAyatLocal;

  HomeRepositoryImpl({
    required ApiService apiService,
    required NetworkHelper helper,
    required ApiLocalService apiLocalService,
    required SaveAyatLocal saveAyatLocal,
  }) : _apiService = apiService,
       _helper = helper,
       _apiLocalService = apiLocalService,
       _saveAyatLocal = saveAyatLocal;

  @override
  Future<List<Surah>> getListSurah() async {
    final isConnected = await _helper.isConnected();
    try {
      if (isConnected) {
        final result = await _apiService.getListSurah();
        await _apiLocalService.addListSurahToLocal(result.data ?? []);
        return result.data ?? [];
      } else {
        final result = await _apiLocalService.getListSurahFromLocal();
        return result.data ?? [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<SaveAyatModel> getAyatLastRead() async {
    try {
      final result = await _saveAyatLocal.getAyatLastRead();
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  factory HomeRepositoryImpl.create() {
    return HomeRepositoryImpl(
      apiService: ApiServiceImpl.create(),
      helper: NetworkHelperImpl.create(),
      apiLocalService: ApiLocalServiceImpl(),
      saveAyatLocal: SaveAyatLocal(),
    );
  }
}
