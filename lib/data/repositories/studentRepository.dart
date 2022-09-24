import 'package:eschool_teacher/data/models/guardianDetails.dart';
import 'package:eschool_teacher/data/models/student.dart';
import 'package:eschool_teacher/utils/api.dart';

class StudentRepository {
  Future<List<Student>> getStudentsByClassSection(
      {required int classSectionId}) async {
    try {
      final result = await Api.get(
          url: Api.getStudentsByClassSection,
          useAuthToken: true,
          queryParameters: {"class_section_id": classSectionId});

      return (result['data'] as List)
          .map((e) => Student.fromJson(Map.from(e)))
          .toList();
    } catch (e) {
      throw ApiException(e.toString());
    }
  }

  Future<Map<String, dynamic>> getStudentsMoreDetails(
      {required int studentId}) async {
    try {
      final result = await Api.get(
          url: Api.getStudentsMoreDetails,
          useAuthToken: true,
          queryParameters: {"student_id": studentId});

      return {
        "fatherDetails": (result['father_data'] as List)
            .map((details) => GuardianDetails.fromJson(Map.from(details)))
            .toList()
            .first,
        "motherDetails": (result['mother_data'] as List)
            .map((details) => GuardianDetails.fromJson(Map.from(details)))
            .toList()
            .first,
        "guardianDetails": result['gurdian_data'] != null
            ? (result['gurdian_data'] as List)
                .map((details) => GuardianDetails.fromJson(Map.from(details)))
                .toList()
                .first
            : GuardianDetails.fromJson(Map.from({})),
        "totalPresent": result['total_present'],
        "totalAbsent": result['total_absent'],
        "todayAttendance": result['today_attendance'],
      };
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
