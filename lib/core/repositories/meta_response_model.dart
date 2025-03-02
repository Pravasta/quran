import 'dart:convert';

class MetaResponse {
  final String? message;
  final int? errorCode;
  final Map<String, dynamic>? result;

  MetaResponse({this.message, this.errorCode, this.result});

  factory MetaResponse.fromJson(String str) =>
      MetaResponse.fromMap(json.decode(str));

  factory MetaResponse.fromMap(Map<String, dynamic> json) => MetaResponse(
    message: json["message"],
    errorCode: json["code"],
    result: json["data"],
  );
}
