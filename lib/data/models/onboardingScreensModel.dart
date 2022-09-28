// To parse this JSON data, do
//
//     final onboardingScreensModel = onboardingScreensModelFromJson(jsonString);

import 'dart:convert';

OnboardingScreensModel onboardingScreensModelFromJson(String str) => OnboardingScreensModel.fromJson(json.decode(str));


class OnboardingScreensModel {
  OnboardingScreensModel({
    required this.error,
    required this.onboardingScreens,
    required this.code,
  });

  bool error;
  List<OnboardingScreen>? onboardingScreens;
  int code;

  factory OnboardingScreensModel.fromJson(Map<String, dynamic> json) => OnboardingScreensModel(
    error: json["error"] == null ? null : json["error"],
    onboardingScreens: json["onboardingScreens"] == null ? null : List<OnboardingScreen>.from(json["onboardingScreens"].map((x) => OnboardingScreen?.fromJson(x))),
    code: json["code"] == null ? null : json["code"],
  );
}

class OnboardingScreen {
  OnboardingScreen({
    required this.id,
    required this.title,
    required  this.subTitle,
    required  this.image,
    required  this.userId,
    this.createdAt,
    this.updatedAt,
    required this.onboardingScreenFor,
  });

  int id;
  String title;
  String subTitle;
  String image;
  int userId;
  dynamic createdAt;
  dynamic updatedAt;
  String onboardingScreenFor;

  factory OnboardingScreen.fromJson(Map<String, dynamic> json) => OnboardingScreen(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    subTitle: json["sub_title"] == null ? null : json["sub_title"],
    image: json["image"] == null ? null : json["image"],
    userId: json["user_id"] == null ? null : json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    onboardingScreenFor: json["for"] == null ? null : json["for"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "sub_title": subTitle == null ? null : subTitle,
    "image": image == null ? null : image,
    "user_id": userId == null ? null : userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "for": onboardingScreenFor == null ? null : onboardingScreenFor,
  };
}
