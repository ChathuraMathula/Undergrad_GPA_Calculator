import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:undergrad_tracker/models/database_result.dart';
import 'package:undergrad_tracker/models/grade.dart';
import 'package:undergrad_tracker/models/result.dart';

final config = Configuration.local([DatabaseResult.schema]);
final realm = Realm(config);

class ResultsNotifier extends StateNotifier<List<Result>> {
  ResultsNotifier() : super(_initializeResults());

  static List<Result> _initializeResults() {
    final databaseResults = realm.all<DatabaseResult>();

    final List<Result> results = [];

    for (final databaseResult in databaseResults) {
      final grade = Grade.values.firstWhere(
        (currGrade) {
          return databaseResult.grade == currGrade.text;
        },
      );

      final curResult = Result(
        courseCode: databaseResult.courseCode,
        courseYear: databaseResult.courseYear,
        grade: grade,
        credits: databaseResult.credits,
        isNonGPA: databaseResult.isNonGPA,
      );

      results.add(curResult);
    }

    return results;
  }

  void addResult(Result result) {
    final newDatabaseResult = DatabaseResult(
      result.courseCode,
      result.grade.text,
      result.grade.point,
      result.courseYear,
      result.credits,
      result.isNonGPA,
      result.gradePoints,
      result.gpaCredits,
    );

    realm.write(() {
      realm.add(newDatabaseResult);
    });

    state = [...state, result];
  }

  void addResultAt({required int index, required Result result}) {
    List<Result> results = [...state];
    List<DatabaseResult> databaseResults = [...realm.all<DatabaseResult>()];

    results.insert(index, result);
    databaseResults.insert(
      index,
      DatabaseResult(
        result.courseCode,
        result.grade.text,
        result.grade.point,
        result.courseYear,
        result.credits,
        result.isNonGPA,
        result.gradePoints,
        result.gpaCredits,
      ),
    );

    // final List<DatabaseResult> databaseResults = results.map(
    //   (result) {
    //     return DatabaseResult(
    //       result.courseCode,
    //       result.grade.text,
    //       result.grade.point,
    //       result.courseYear,
    //       result.credits,
    //       result.isNonGPA,
    //       result.gradePoints,
    //       result.gpaCredits,
    //     );
    //   },
    // ).toList();

    realm.write(() {
      realm.addAll(databaseResults);
    });

    state = results;
  }

  void removeResult(Result result) {
    final existingDatabaseResult = realm.find<DatabaseResult>(
      result.courseCode,
    );

    if (existingDatabaseResult != null) {
      realm.write(() {
        realm.delete(existingDatabaseResult);
      });
    }

    state = state
        .where(
          (curResult) => curResult.courseCode != result.courseCode,
        )
        .toList();
  }

  void updateResult(Result result) {
    List<Result> results = [...state];

    final newResult = Result(
      courseCode: result.courseCode,
      courseYear: result.courseYear,
      grade: result.grade,
      credits: result.credits,
      isNonGPA: result.isNonGPA,
    );

    final existingDatabaseResult =
        realm.find<DatabaseResult>(result.courseCode);

    if (existingDatabaseResult != null) {
      realm.write(() {
        existingDatabaseResult.courseYear = result.courseYear;
        existingDatabaseResult.grade = result.grade.text;
        existingDatabaseResult.gradePoint = result.grade.point;
        existingDatabaseResult.gradePoints = result.gradePoints;
        existingDatabaseResult.credits = result.credits;
        existingDatabaseResult.gpaCredits = result.gpaCredits;
        existingDatabaseResult.isNonGPA = result.isNonGPA;
      });
    }

    for (var i = 0; i < results.length; i++) {
      if (results[i].courseCode == result.courseCode) {
        results[i] = newResult;
        break;
      }
    }

    state = results;
  }
}

final resultsProvider =
    StateNotifierProvider<ResultsNotifier, List<Result>>((ref) {
  return ResultsNotifier();
});
