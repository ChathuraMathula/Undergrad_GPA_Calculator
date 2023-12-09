import 'package:realm/realm.dart';

part 'database_result.g.dart';

@RealmModel()
class _DatabaseResult {
  @PrimaryKey()
  late final String courseCode;

  late String grade;
  late double gradePoint;
  late int courseYear;
  late int credits;
  late bool isNonGPA;
  late double gradePoints;
  late int gpaCredits;
}
