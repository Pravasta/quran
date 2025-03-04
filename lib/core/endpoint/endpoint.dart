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

  Uri getCodeLocation(String location) {
    return UriHelper.createUrl(
      host: 'api.myquran.com',
      path: 'v2/sholat/kota/cari/$location',
      queryParameters: {},
    );
  }

  Uri getJadwalSholat(String code, int tahun, int bulan, int tanggal) {
    return UriHelper.createUrl(
      host: 'api.myquran.com',
      path: 'v2/sholat/jadwal/$code/$tahun/$bulan/$tanggal',
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
