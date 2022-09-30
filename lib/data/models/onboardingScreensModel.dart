// To parse this JSON data, do
//
//     final onboardingScreensModel = onboardingScreensModelFromJson(jsonString);

import 'dart:convert';

OnboardingScreensModel onboardingScreensModelFromJson(String str) => OnboardingScreensModel.fromJson(json.decode(str));


class OnboardingScreensModel {
  OnboardingScreensModel({
     this.error,
     this.onboardingScreens,
     this.code,
  });

  bool? error;
  List<OnboardingScreen>? onboardingScreens;
  int? code;

  factory OnboardingScreensModel.fromJson(Map<String, dynamic> json) => OnboardingScreensModel(
    error: json["error"] == null ? null : json["error"],
    onboardingScreens: json["onboardingScreens"] == null ? null : List<OnboardingScreen>.from(json["onboardingScreens"].map((x) => OnboardingScreen?.fromJson(x))),
    code: json["code"] == null ? null : json["code"],
  );
}

class OnboardingScreen {
  OnboardingScreen({
    this.id,
    this.title,
    this.titleAr,
    this.subTitle,
    this.subTitleAr,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.onboardingScreenFor,
  });

  dynamic id;
  dynamic title;
  dynamic titleAr;
  dynamic subTitle;
  dynamic subTitleAr;
  dynamic image;
  dynamic userId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic onboardingScreenFor;

  factory OnboardingScreen.fromJson(Map<String, dynamic> json) => OnboardingScreen(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    titleAr: json["title_ar"] == null ? null : json["title_ar"],
    subTitleAr: json["sub_title_ar"] == null ? null : json["sub_title_ar"],
    subTitle: json["sub_title"] == null ? null : json["sub_title"],
    image: json["image"] == null ? null : json["image"],
    userId: json["user_id"] == null ? null : json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    onboardingScreenFor: json["for"] == null ? null : json["for"],
  );

}
