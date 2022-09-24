import 'package:get/get.dart';

class SubjectController extends GetxController {
  List mySubjects = [];
  List myRanges = [];
  List myMainSubjects = [];

  void add(
      {required int subjectName, required var range, required int isMain}) {
    mySubjects.add(subjectName);
    myRanges.add(range);
    myMainSubjects.add(isMain);

    print(mySubjects);
    print(myRanges);
    print(myMainSubjects);
  }
}
