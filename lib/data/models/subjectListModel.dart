// To parse this JSON data, do
//
//     final subjectListModel = subjectListModelFromJson(jsonString);

import 'dart:convert';

List<SubjectListModel> subjectListModelFromJson(String str) => List<SubjectListModel>.from(json.decode(str).map((x) => SubjectListModel.fromJson(x)));

String subjectListModelToJson(List<SubjectListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectListModel {
  SubjectListModel({
   required this.id,
    required  this.name,
    required  this.code,
    required   this.bgColor,
    required  this.image,
    required  this.mediumId,
    required  this.type,
  });

  int id;
  String name;
  String code;
  String bgColor;
  String image;
  int mediumId;
  String type;

  factory SubjectListModel.fromJson(Map<String, dynamic> json) => SubjectListModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    bgColor: json["bg_color"] == null ? null : json["bg_color"],
    image: json["image"] == null ? null : json["image"],
    mediumId: json["medium_id"] == null ? null : json["medium_id"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "bg_color": bgColor == null ? null : bgColor,
    "image": image == null ? null : image,
    "medium_id": mediumId == null ? null : mediumId,
    "type": type == null ? null : type,
  };
}
