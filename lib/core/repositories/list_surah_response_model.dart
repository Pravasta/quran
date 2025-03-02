import 'dart:convert';

class ListSurahResponseModel {
  final int? code;
  final String? message;
  final List<Surah>? data;

  ListSurahResponseModel({this.code, this.message, this.data});

  ListSurahResponseModel copyWith({
    int? code,
    String? message,
    List<Surah>? data,
  }) => ListSurahResponseModel(
    code: code ?? this.code,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory ListSurahResponseModel.fromJson(String str) =>
      ListSurahResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListSurahResponseModel.fromMap(Map<String, dynamic> json) =>
      ListSurahResponseModel(
        code: json["code"],
        message: json["message"],
        data:
            json["data"] == null
                ? []
                : List<Surah>.from(json["data"]!.map((x) => Surah.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Surah {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final String? deskripsi;
  final AudioFull? audioFull;

  Surah({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
  });

  Surah copyWith({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    AudioFull? audioFull,
  }) => Surah(
    nomor: nomor ?? this.nomor,
    nama: nama ?? this.nama,
    namaLatin: namaLatin ?? this.namaLatin,
    jumlahAyat: jumlahAyat ?? this.jumlahAyat,
    tempatTurun: tempatTurun ?? this.tempatTurun,
    arti: arti ?? this.arti,
    deskripsi: deskripsi ?? this.deskripsi,
    audioFull: audioFull ?? this.audioFull,
  );

  factory Surah.fromJson(String str) => Surah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Surah.fromMap(Map<String, dynamic> json) => Surah(
    nomor: json["nomor"],
    nama: json["nama"],
    namaLatin: json["namaLatin"],
    jumlahAyat: json["jumlahAyat"],
    tempatTurun: json["tempatTurun"],
    arti: json["arti"],
    deskripsi: json["deskripsi"],
    audioFull:
        json["audioFull"] == null ? null : AudioFull.fromMap(json["audioFull"]),
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
  };
}

class AudioFull {
  final String? the01;
  final String? the02;
  final String? the03;
  final String? the04;
  final String? the05;

  AudioFull({this.the01, this.the02, this.the03, this.the04, this.the05});

  AudioFull copyWith({
    String? the01,
    String? the02,
    String? the03,
    String? the04,
    String? the05,
  }) => AudioFull(
    the01: the01 ?? this.the01,
    the02: the02 ?? this.the02,
    the03: the03 ?? this.the03,
    the04: the04 ?? this.the04,
    the05: the05 ?? this.the05,
  );

  factory AudioFull.fromJson(String str) => AudioFull.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AudioFull.fromMap(Map<String, dynamic> json) => AudioFull(
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
