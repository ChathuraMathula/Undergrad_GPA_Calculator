import 'package:undergrad_tracker/models/grade.dart';

class Result {
  Result({
    required this.courseCode,
    required this.courseYear,
    required this.grade,
    required this.credits,
    required this.isNonGPA,
  });

  String courseCode;
  Grade grade;
  String courseYear;
  String credits;
  bool isNonGPA;
}
