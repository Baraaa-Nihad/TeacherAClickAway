import 'package:image_picker/image_picker.dart';

class TeacherRegister {
  bool? error;
  String? message;
  Data? data;
  int? code;

  TeacherRegister();

  TeacherRegister.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    // data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  Teacher? teacher;

  Data();

  // Data.fromJson(Map<String, dynamic> json) {
  //   teacher =
  //       json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}

// class Teacher {
//   late String first_name;
//   late String last_name;
//   late String email;
//   late String gender;
//   late String intro;
//   late String phone;
//   late String birth_day;
//   late String national_id_number;
//   late dynamic national_id_photo;
//   late dynamic certificate;
//   late String bio;
//   late String experience;
//   late String country;
//   late String village;
//   late String e_contact_name;
//   late String e_contact_number;
//   late dynamic p_work;
//   late dynamic P_work_number;
//   late dynamic p_work_place;
//   late String r_leaving_prev_job;
//   late String work_there;
//   late dynamic doc_lack_crimes;
//   late dynamic profile;
//   late dynamic previous_work;
//   late List subject_ids;
//   late List grades_from;
//   late List grades_to;
//   late List main_subjects;
//   late List docLackCrimes;
//
//   Teacher();
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this.first_name;
//     data['last_name'] = this.last_name;
//     data['email'] = this.email;
//     data['gender'] = this.gender;
//     data['intro'] = this.intro;
//     data['phone'] = this.phone;
//     data['birth_day'] = this.birth_day;
//     data['national_id_number'] = this.national_id_number;
//     data['national_id_photo'] = this.national_id_photo;
//     data['certificate'] = this.certificate;
//     data['bio'] = this.bio;
//     data['experience'] = this.experience;
//     data['country'] = this.country;
//     data['village'] = this.village;
//     data['e_contact_name'] = this.e_contact_name;
//     data['e_contact_number'] = this.e_contact_number;
//     data['p_work'] = this.p_work;
//     data['P_work_number'] = this.P_work_number;
//     data['p_work_place'] = this.p_work_place;
//     data['r_leaving_prev_job'] = this.r_leaving_prev_job;
//     data['work_there'] = this.work_there;
//     data['doc_lack_crimes'] = this.doc_lack_crimes;
//     data['profile'] = this.profile;
//     data['previous_work'] = this.previous_work;
//     data['subject_ids'] = this.subject_ids;
//     data['grades_from'] = this.grades_from;
//     data['grades_to'] = this.grades_to;
//     data['main_subjects'] = this.main_subjects;
//     data['docLackCrimes'] = this.docLackCrimes;
//
//     return data;
//   }
// }
class Teacher {
  late dynamic first_name;
  late dynamic last_name;
  late dynamic email;
  late dynamic gender;
  late dynamic intro;
  late dynamic phone;
  late dynamic birth_day;
  late dynamic national_id_number;
  late dynamic national_id_photo;
  late String certificate;
  late dynamic bio;
  late dynamic experience;
  late dynamic country;
  late dynamic village;
  late dynamic e_contact_name;
  late dynamic e_contact_number;
  late dynamic p_work;
  late dynamic P_work_number;
  late dynamic p_work_place;
  late dynamic r_leaving_prev_job;
  late dynamic work_there;
  late String doc_lack_crimes;
  late String profile;
  late dynamic previous_work;
  late String subject_ids;
  late String grades_from;
  late String grades_to;
  late String main_subjects;
  late dynamic docLackCrimes;

  Teacher();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['intro'] = this.intro;
    data['phone'] = this.phone;
    data['birth_day'] = this.birth_day;
    data['national_id_number'] = this.national_id_number;
    data['national_id_photo'] = this.national_id_photo;
    data['certificate'] = this.certificate;
    data['bio'] = this.bio;
    data['experience'] = this.experience;
    data['country'] = this.country;
    data['village'] = this.village;
    data['e_contact_name'] = this.e_contact_name;
    data['e_contact_number'] = this.e_contact_number;
    data['p_work'] = this.p_work;
    data['P_work_number'] = this.P_work_number;
    data['p_work_place'] = this.p_work_place;
    data['r_leaving_prev_job'] = this.r_leaving_prev_job;
    data['work_there'] = this.work_there;
    data['doc_lack_crimes'] = this.doc_lack_crimes;
    data['profile'] = this.profile;
    data['previous_work'] = this.previous_work;
    data['subject_ids'] = this.subject_ids;
    data['grades_from'] = this.grades_from;
    data['grades_to'] = this.grades_to;
    data['main_subjects'] = this.main_subjects;
    data['docLackCrimes'] = this.docLackCrimes;
    return data;
  }
}
