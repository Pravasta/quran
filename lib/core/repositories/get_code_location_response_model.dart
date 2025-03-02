import 'dart:convert';

class GetCodeLocationResponseModel {
  final bool? status;
  final Request? request;
  final List<Lokasi>? data;

  GetCodeLocationResponseModel({this.status, this.request, this.data});

  factory GetCodeLocationResponseModel.fromJson(String str) =>
      GetCodeLocationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCodeLocationResponseModel.fromMap(
    Map<String, dynamic> json,
  ) => GetCodeLocationResponseModel(
    status: json["status"],
    request: json["request"] == null ? null : Request.fromMap(json["request"]),
    data:
        json["data"] == null
            ? []
            : List<Lokasi>.from(json["data"]!.map((x) => Lokasi.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "request": request?.toMap(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Lokasi {
  final String? id;
  final String? lokasi;

  Lokasi({this.id, this.lokasi});

  factory Lokasi.fromJson(String str) => Lokasi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lokasi.fromMap(Map<String, dynamic> json) =>
      Lokasi(id: json["id"], lokasi: json["lokasi"]);

  Map<String, dynamic> toMap() => {"id": id, "lokasi": lokasi};
}

class Request {
  final String? path;
  final String? keyword;

  Request({this.path, this.keyword});

  factory Request.fromJson(String str) => Request.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Request.fromMap(Map<String, dynamic> json) =>
      Request(path: json["path"], keyword: json["keyword"]);

  Map<String, dynamic> toMap() => {"path": path, "keyword": keyword};
}
