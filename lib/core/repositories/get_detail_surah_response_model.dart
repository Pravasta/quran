import 'dart:convert';

class GetDetailSurahResponseModel {
  final int? code;
  final String? message;
  final DetailSurah? data;

  GetDetailSurahResponseModel({this.code, this.message, this.data});

  factory GetDetailSurahResponseModel.fromJson(String str) =>
      GetDetailSurahResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetDetailSurahResponseModel.fromMap(Map<String, dynamic> json) =>
      GetDetailSurahResponseModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : DetailSurah.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "code": code,
    "message": message,
    "data": data?.toMap(),
  };
}

class DetailSurah {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final String? deskripsi;
  final Audio? audioFull;
  final List<Ayat>? ayat;
  final dynamic suratSelanjutnya;
  final dynamic suratSebelumnya;

  DetailSurah({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory DetailSurah.fromJson(String str) =>
      DetailSurah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailSurah.fromMap(Map<String, dynamic> json) => DetailSurah(
    nomor: json["nomor"],
    nama: json["nama"],
    namaLatin: json["namaLatin"],
    jumlahAyat: json["jumlahAyat"],
    tempatTurun: json["tempatTurun"],
    arti: json["arti"],
    deskripsi: json["deskripsi"],
    audioFull:
        json["audioFull"] == null ? null : Audio.fromMap(json["audioFull"]),
    ayat:
        json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromMap(x))),
    suratSelanjutnya:
        json["suratSelanjutnya"] == false
            ? false
            : SuratSenya.fromMap(json["suratSelanjutnya"]),
    suratSebelumnya:
        json["suratSebelumnya"] == false
            ? false
            : SuratSenya.fromMap(json["suratSebelumnya"]),
  );

  Map<String, dynamic> toMap() => {
    "nomor": nomor,
    "nama": nama,
    "namaLatin": namaLatin,
    "jumlahAyat": jumlahAyat,
    "tempatTurun": tempatTurun,
    "arti": arti,
    "deskripsi": deskripsi,
    "audioFull": audioFull?.toMap(),
    "ayat": ayat == null ? [] : List<dynamic>.from(ayat!.map((x) => x.toMap())),
    "suratSelanjutnya":
        suratSelanjutnya == false ? false : suratSelanjutnya?.toMap(),
    "suratSebelumnya":
        suratSebelumnya == false ? false : suratSebelumnya?.toMap(),
  };
}

class Audio {
  final String? the01;
  final String? the02;
  final String? the03;
  final String? the04;
  final String? the05;

  Audio({this.the01, this.the02, this.the03, this.the04, this.the05});

  factory Audio.fromJson(String str) => Audio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Audio.fromMap(Map<String, dynamic> json) => Audio(
    the01: json["01"],
    the02: json["02"],
    the03: json["03"],
    the04: json["04"],
    the05: json["05"],
  );

  Map<String, dynamic> toMap() => {
    "01": the01,
    "02": the02,
    "03": the03,
    "04": the04,
    "05": the05,
  };
}

class Ayat {
  final int? nomorAyat;
  final String? teksArab;
  final String? teksLatin;
  final String? teksIndonesia;
  final Audio? audio;

  Ayat({
    this.nomorAyat,
    this.teksArab,
    this.teksLatin,
    this.teksIndonesia,
    this.audio,
  });

  factory Ayat.fromJson(String str) => Ayat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ayat.fromMap(Map<String, dynamic> json) => Ayat(
    nomorAyat: json["nomorAyat"],
    teksArab: json["teksArab"],
    teksLatin: json["teksLatin"],
    teksIndonesia: json["teksIndonesia"],
    audio: json["audio"] == null ? null : Audio.fromMap(json["audio"]),
  );

  Map<String, dynamic> toMap() => {
    "nomorAyat": nomorAyat,
    "teksArab": teksArab,
    "teksLatin": teksLatin,
    "teksIndonesia": teksIndonesia,
    "audio": audio?.toMap(),
  };
}

class SuratSenya {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;

  SuratSenya({this.nomor, this.nama, this.namaLatin, this.jumlahAyat});

  factory SuratSenya.fromJson(String str) =>
      SuratSenya.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SuratSenya.fromMap(Map<String, dynamic> json) => SuratSenya(
    nomor: json["nomor"],
    nama: json["nama"],
    namaLatin: json["namaLatin"],
    jumlahAyat: json["jumlahAyat"],
  );

  Map<String, dynamic> toMap() => {
    "nomor": nomor,
    "nama": nama,
    "namaLatin": namaLatin,
    "jumlahAyat": jumlahAyat,
  };
}
