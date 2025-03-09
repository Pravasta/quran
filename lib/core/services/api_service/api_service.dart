import 'package:quran/core/endpoint/endpoint.dart';
import 'package:quran/core/exception/app_exception.dart';
import 'package:quran/core/exception/met_exception_handler.dart';
import 'package:quran/core/network/http_client.dart';
import 'package:quran/core/network/network_logger.dart';
import 'package:quran/core/repositories/get_code_location_response_model.dart';
import 'package:quran/core/repositories/get_detail_surah_response_model.dart';
import 'package:quran/core/repositories/get_jadwal_sholat_response_model.dart';
import 'package:quran/core/repositories/list_surah_response_model.dart';
import 'package:quran/core/repositories/meta_response_model.dart';

abstract class ApiService {
  Future<ListSurahResponseModel> getListSurah();
  Future<GetDetailSurahResponseModel> getDetailSurah(int surahNumber);
  Future<GetCodeLocationResponseModel> getCodeLocation(String location);
  Future<GetJadwalSholatResponseModel> getJadwalSholat(
    String code,
    int tahun,
    int bulan,
    int tanggal,
  );
}

class ApiServiceImpl implements ApiService {
  final CoinsleekHttpClient _httpClient;
  final Endpoint _endpoint;

  ApiServiceImpl(this._httpClient, this._endpoint);

  @override
  Future<ListSurahResponseModel> getListSurah() async {
    final url = _endpoint.getALlSurah();
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await _httpClient.get(url, headers);

      appNetworkLogger(
        endpoint: url.toString(),
        payload: headers.toString(),
        response: response.body.toString(),
      );

      if (response.statusCode == 200) {
        return ListSurahResponseModel.fromJson(response.body);
      } else {
        MetaResponse metaResponse = MetaResponse.fromJson(response.body);
        if (metaResponse.errorCode != 200) {
          MetaExceptionHandler(
            response.statusCode,
            response.body,
          ).handleByErrorCode();
        }
        throw AppException(metaResponse.message ?? "Unknown Error");
      }
    } catch (e) {
      throw AppException(e.toString()).message;
    }
  }

  @override
  Future<GetDetailSurahResponseModel> getDetailSurah(int surahNumber) async {
    final url = _endpoint.getDetailSurah(surahNumber);
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await _httpClient.get(url, headers);

      appNetworkLogger(
        endpoint: url.toString(),
        payload: headers.toString(),
        response: response.body.toString(),
      );

      if (response.statusCode == 200) {
        return GetDetailSurahResponseModel.fromJson(response.body);
      }

      MetaResponse metaResponse = MetaResponse.fromJson(response.body);
      if (metaResponse.errorCode != 200) {
        MetaExceptionHandler(
          response.statusCode,
          response.body,
        ).handleByErrorCode();
      }

      throw AppException(metaResponse.message ?? "Unknown Error");
    } catch (e) {
      throw AppException(e.toString()).message;
    }
  }

  @override
  Future<GetCodeLocationResponseModel> getCodeLocation(String location) async {
    final url = _endpoint.getCodeLocation(location);
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await _httpClient.get(url, headers);

      appNetworkLogger(
        endpoint: url.toString(),
        payload: headers.toString(),
        response: response.body.toString(),
      );

      if (response.statusCode == 200) {
        return GetCodeLocationResponseModel.fromJson(response.body);
      }

      throw AppException("Unknown Error").message;
    } catch (e) {
      throw AppException(e.toString()).message;
    }
  }

  @override
  Future<GetJadwalSholatResponseModel> getJadwalSholat(
    String code,
    int tahun,
    int bulan,
    int tanggal,
  ) async {
    final url = _endpoint.getJadwalSholat(code, tahun, bulan, tanggal);
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await _httpClient.get(url, headers);

      appNetworkLogger(
        endpoint: url.toString(),
        payload: headers.toString(),
        response: response.body.toString(),
      );

      if (response.statusCode == 200) {
        return GetJadwalSholatResponseModel.fromJson(response.body);
      }

      throw AppException("Unknown Error").message;
    } catch (e) {
      throw AppException(e.toString()).message;
    }
  }

  factory ApiServiceImpl.create() {
    return ApiServiceImpl(CoinsleekHttpClient.create(), Endpoint.baseUrlApi());
  }
}
