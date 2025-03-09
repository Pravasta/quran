import 'dart:convert';

class SaveAyatModel {
  final int? nomorAyat;
  final String? namaSurat;
  final int? nomorSurat;

  SaveAyatModel({this.nomorAyat, this.namaSurat, this.nomorSurat});

  factory SaveAyatModel.fromJson(String str) =>
      SaveAyatModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaveAyatModel.fromMap(Map<String, dynamic> json) => SaveAyatModel(
    nomorAyat: json["nomorAyat"],
    namaSurat: json["namaSurat"],
    nomorSurat: json["nomorSurat"],
  );

  Map<String, dynamic> toMap() => {
    "nomorAyat": nomorAyat,
    "namaSurat": namaSurat,
    "nomorSurat": nomorSurat,
  };
}
