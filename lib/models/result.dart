class Result {
  Result(
      {required this.courseCode,
      required this.courseYear,
      required this.grade,
      required this.credits,
      required this.isCountForGPA});

  String courseCode;
  String grade;
  String courseYear;
  int credits;
  bool isCountForGPA;
}
