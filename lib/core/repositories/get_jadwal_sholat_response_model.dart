import 'dart:convert';

class GetJadwalSholatResponseModel {
  final bool? status;
  final Request? request;
  final Data? data;

  GetJadwalSholatResponseModel({this.status, this.request, this.data});

  factory GetJadwalSholatResponseModel.fromJson(String str) =>
      GetJadwalSholatResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetJadwalSholatResponseModel.fromMap(Map<String, dynamic> json) =>
      GetJadwalSholatResponseModel(
        status: json["status"],
        request:
            json["request"] == null ? null : Request.fromMap(json["request"]),
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "request": request?.toMap(),
    "data": data?.toMap(),
  };
}

class Data {
  final int? id;
  final String? lokasi;
  final String? daerah;
  final Jadwal? jadwal;

  Data({this.id, this.lokasi, this.daerah, this.jadwal});

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    lokasi: json["lokasi"],
    daerah: json["daerah"],
    jadwal: json["jadwal"] == null ? null : Jadwal.fromMap(json["jadwal"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "lokasi": lokasi,
    "daerah": daerah,
    "jadwal": jadwal?.toMap(),
  };
}

class Jadwal {
  final String? tanggal;
  final String? imsak;
  final String? subuh;
  final String? terbit;
  final String? dhuha;
  final String? dzuhur;
  final String? ashar;
  final String? maghrib;
  final String? isya;
  final DateTime? date;

  Jadwal({
    this.tanggal,
    this.imsak,
    this.subuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.date,
  });

  factory Jadwal.fromJson(String str) => Jadwal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Jadwal.fromMap(Map<String, dynamic> json) => Jadwal(
    tanggal: json["tanggal"],
    imsak: json["imsak"],
    subuh: json["subuh"],
    terbit: json["terbit"],
    dhuha: json["dhuha"],
    dzuhur: json["dzuhur"],
    ashar: json["ashar"],
    maghrib: json["maghrib"],
    isya: json["isya"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "tanggal": tanggal,
    "imsak": imsak,
    "subuh": subuh,
    "terbit": terbit,
    "dhuha": dhuha,
    "dzuhur": dzuhur,
    "ashar": ashar,
    "maghrib": maghrib,
    "isya": isya,
    "date":
        "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
  };
}

class Request {
  final String? path;

  Request({this.path});

  factory Request.fromJson(String str) => Request.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Request.fromMap(Map<String, dynamic> json) =>
      Request(path: json["path"]);

  Map<String, dynamic> toMap() => {"path": path};
}
