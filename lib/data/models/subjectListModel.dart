// To parse this JSON data, do
//
//     final subjectListModel = subjectListModelFromJson(jsonString);

import 'dart:convert';

List<SubjectListModel> subjectListModelFromJson(String str) => List<SubjectListModel>.from(json.decode(str).map((x) => SubjectListModel.fromJson(x)));


class SubjectListModel {
  SubjectListModel({
    this.id,
    this.name,
    this.nameAr,
    this.code,
    this.bgColor,
    this.image,
    this.mediumId,
    this.type,
  });

  int? id;
  dynamic name;
  dynamic nameAr;
  dynamic code;
  dynamic bgColor;
  dynamic image;
  dynamic mediumId;
  dynamic type;

  factory SubjectListModel.fromJson(Map<String, dynamic> json) => SubjectListModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    nameAr: json["name_ar"] == null ? null : json["name_ar"],
    code: json["code"] == null ? null : json["code"],
    bgColor: json["bg_color"] == null ? null : json["bg_color"],
    image: json["image"] == null ? null : json["image"],
    mediumId: json["medium_id"] == null ? null : json["medium_id"],
    type: json["type"] == null ? null : json["type"],
  );
}
