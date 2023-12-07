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

    for (final curResult in results) {
      if (curResult.courseCode == result.courseCode) {
        curResult.courseYear = result.courseYear;
        curResult.credits = result.credits;
        curResult.grade = result.grade;
        curResult.isNonGPA = result.isNonGPA;
      } else {
        continue;
      }
    }

    state = results;
  }
}

final resultsProvider =
    StateNotifierProvider<ResultsNotifier, List<Result>>((ref) {
  return ResultsNotifier();
});
