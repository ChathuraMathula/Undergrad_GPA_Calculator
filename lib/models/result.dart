import 'package:undergrad_tracker/models/grade.dart';

class Result {
  Result({
    required this.courseCode,
    required this.courseYear,
    required this.grade,
    required this.credits,
    required this.isNonGPA,
  })  : gradePoints = isNonGPA ? 0.00 : grade.point * credits,
        gpaCredits = isNonGPA ? 0 : credits;

  String courseCode;
  Grade grade;
  int courseYear;
  int credits;
  bool isNonGPA;
  double gradePoints;
  int gpaCredits;
}
