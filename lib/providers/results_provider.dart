import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/models/result.dart';

class ResultsNotifier extends StateNotifier<List<Result>> {
  ResultsNotifier() : super([]);

  void addResult(Result result) {
    state = [...state, result];
  }

  void addResultAt({required int index, required Result result}) {
    List<Result> results = [...state];

    results.insert(index, result);

    state = results;
  }

  void removeResult(Result result) {
    state = state
        .where((curResult) => curResult.courseCode != result.courseCode)
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
