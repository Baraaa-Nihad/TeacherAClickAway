// To parse this JSON data, do
//
//     final registerTeacher = registerTeacherFromJson(jsonString);

import 'dart:convert';

RegisterTeacher registerTeacherFromJson(String str) => RegisterTeacher.fromJson(json.decode(str));

String registerTeacherToJson(RegisterTeacher data) => json.encode(data.toJson());

class RegisterTeacher {
  RegisterTeacher({
    this.error,
    this.message,
    this.data,
    this.code,
  });

  bool? error;
  String? message;
  Data? data;
  int? code;

  factory RegisterTeacher.fromJson(Map<String, dynamic> json) => RegisterTeacher(
    error: json["error"] == null ? null : json["error"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "error": error == null ? null : error,
    "message": message == null ? null : message,
    "data": data == null ? null : data?.toJson(),
    "code": code == null ? null : code,
  };
}

class Data {
  Data({
    this.teacher,
  });

  Teacher? teacher;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    teacher: json["teacher"] == null ? null : Teacher?.fromJson(json["teacher"]),
  );

  Map<String, dynamic> toJson() => {
    "teacher": teacher == null ? null : teacher?.toJson(),
  };
}

class Teacher {
  Teacher({
    this.intro,
    this.nationalIdNumber,
    this.nationalIdPhoto,
    this.certificate,
    this.bio,
    this.experience,
    this.country,
    this.village,
    this.eContactName,
    this.eContactNumber,
    this.pWork,
    this.pWorkNumber,
    this.pWorkPlace,
    this.rLeavingPrevJob,
    this.workThere,
    this.docLackCrimes,
    this.userId,
    this.id,
    this.user,
  });

  String? intro;
  String? nationalIdNumber;
  String? nationalIdPhoto;
  String? certificate;
  String? bio;
  String? experience;
  String? country;
  String? village;
  String? eContactName;
  String? eContactNumber;
  String? pWork;
  String? pWorkNumber;
  String? pWorkPlace;
  String? rLeavingPrevJob;
  String? workThere;
  String? docLackCrimes;
  int? userId;
  int? id;
  User? user;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    intro: json["intro"] == null ? null : json["intro"],
    nationalIdNumber: json["national_id_number"] == null ? null : json["national_id_number"],
    nationalIdPhoto: json["national_id_photo"] == null ? null : json["national_id_photo"],
    certificate: json["certificate"] == null ? null : json["certificate"],
    bio: json["bio"] == null ? null : json["bio"],
    experience: json["experience"] == null ? null : json["experience"],
    country: json["country"] == null ? null : json["country"],
    village: json["village"] == null ? null : json["village"],
    eContactName: json["e_contact_name"] == null ? null : json["e_contact_name"],
    eContactNumber: json["e_contact_number"] == null ? null : json["e_contact_number"],
    pWork: json["p_work"] == null ? null : json["p_work"],
    pWorkNumber: json["p_work_number"] == null ? null : json["p_work_number"],
    pWorkPlace: json["p_work_place"] == null ? null : json["p_work_place"],
    rLeavingPrevJob: json["r_leaving_prev_job"] == null ? null : json["r_leaving_prev_job"],
    workThere: json["work_there"] == null ? null : json["work_there"],
    docLackCrimes: json["doc_lack_crimes"] == null ? null : json["doc_lack_crimes"],
    userId: json["user_id"] == null ? null : json["user_id"],
    id: json["id"] == null ? null : json["id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "intro": intro == null ? null : intro,
    "national_id_number": nationalIdNumber == null ? null : nationalIdNumber,
    "national_id_photo": nationalIdPhoto == null ? null : nationalIdPhoto,
    "certificate": certificate == null ? null : certificate,
    "bio": bio == null ? null : bio,
    "experience": experience == null ? null : experience,
    "country": country == null ? null : country,
    "village": village == null ? null : village,
    "e_contact_name": eContactName == null ? null : eContactName,
    "e_contact_number": eContactNumber == null ? null : eContactNumber,
    "p_work": pWork == null ? null : pWork,
    "p_work_number": pWorkNumber == null ? null : pWorkNumber,
    "p_work_place": pWorkPlace == null ? null : pWorkPlace,
    "r_leaving_prev_job": rLeavingPrevJob == null ? null : rLeavingPrevJob,
    "work_there": workThere == null ? null : workThere,
    "doc_lack_crimes": docLackCrimes == null ? null : docLackCrimes,
    "user_id": userId == null ? null : userId,
    "id": id == null ? null : id,
    "user": user == null ? null : user?.toJson(),
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.dob,
    this.fcmId,
    this.emailVerifiedAt,
    this.mobile,
    this.image,
    this.currentAddress,
    this.permanentAddress,
    this.status,
    this.resetRequest,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? dob;
  dynamic fcmId;
  dynamic emailVerifiedAt;
  String? mobile;
  String? image;
  dynamic currentAddress;
  dynamic permanentAddress;
  int? status;
  int? resetRequest;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    gender: json["gender"] == null ? null : json["gender"],
    email: json["email"] == null ? null : json["email"],
    dob: json["dob"] == null ? null : json["dob"],
    // dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    fcmId: json["fcm_id"],
    emailVerifiedAt: json["email_verified_at"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    image: json["image"] == null ? null : json["image"],
    currentAddress: json["current_address"],
    permanentAddress: json["permanent_address"],
    status: json["status"] == null ? null : json["status"],
    resetRequest: json["reset_request"] == null ? null : json["reset_request"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "gender": gender == null ? null : gender,
    "email": email == null ? null : email,
    "dob": dob == null ? null : dob,
    // "dob": dob == null ? null : "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "fcm_id": fcmId,
    "email_verified_at": emailVerifiedAt,
    "mobile": mobile == null ? null : mobile,
    "image": image == null ? null : image,
    "current_address": currentAddress,
    "permanent_address": permanentAddress,
    "status": status == null ? null : status,
    "reset_request": resetRequest == null ? null : resetRequest,
  };
}
