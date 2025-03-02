import 'package:quran/core/endpoint/endpoint.dart';
import 'package:quran/core/exception/app_exception.dart';
import 'package:quran/core/exception/met_exception_handler.dart';
import 'package:quran/core/network/http_client.dart';
import 'package:quran/core/network/network_logger.dart';
import 'package:quran/core/repositories/list_surah_response_model.dart';
import 'package:quran/core/repositories/meta_response_model.dart';

abstract class ApiService {
  Future<ListSurahResponseModel> getListSurah();
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
          throw MetaExceptionHandler(
            response.statusCode,
            response.body,
          ).handleByErrorCode();
        } else {
          // throw AppException(metaResponse.message ?? "Unknown Error");
          throw AppException("Unknown Coba");
        }
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  factory ApiServiceImpl.create() {
    return ApiServiceImpl(CoinsleekHttpClient.create(), Endpoint.baseUrlApi());
  }
}
