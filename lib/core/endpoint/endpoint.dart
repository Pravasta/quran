import '../network/url_builder.dart';

class Endpoint {
  final String baseURL;

  Endpoint({required this.baseURL});

  // Note for example endpoint
  Uri getALlSurah() {
    return UriHelper.createUrl(
      host: baseURL,
      path: "api/v2/surat",
      queryParameters: {},
    );
  }

  Uri getDetailSurah(int surahNumber) {
    return UriHelper.createUrl(
      host: baseURL,
      path: 'api/v2/surat/$surahNumber',
      queryParameters: {},
    );
  }

  factory Endpoint.baseURLAdmin() {
    return Endpoint(baseURL: "wa.me");
  }

  factory Endpoint.baseUrlApi() {
    return Endpoint(baseURL: "equran.id");
  }

  factory Endpoint.staging() {
    return Endpoint(baseURL: "tes.futake.co.id");
  }
}
