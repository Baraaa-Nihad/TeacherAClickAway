// To parse this JSON data, do
//
//     final getTermsConditionModel = getTermsConditionModelFromJson(jsonString);

import 'dart:convert';

GetTermsConditionModel getTermsConditionModelFromJson(String str) => GetTermsConditionModel.fromJson(json.decode(str));

String getTermsConditionModelToJson(GetTermsConditionModel data) => json.encode(data.toJson());

class GetTermsConditionModel {
  GetTermsConditionModel({
    required this.error,
    required this.message,
    required this.data,
    required this.code,
  });

  bool error;
  String message;
  String data;
  int code;

  factory GetTermsConditionModel.fromJson(Map<String, dynamic> json) => GetTermsConditionModel(
    error: json["error"] == null ? null : json["error"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : json["data"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "error": error == null ? null : error,
    "message": message == null ? null : message,
    "data": data == null ? null : data,
    "code": code == null ? null : code,
  };
}
