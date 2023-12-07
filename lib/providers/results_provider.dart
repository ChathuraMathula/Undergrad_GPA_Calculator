import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/models/result.dart';

class ResultsNotifier extends StateNotifier<List<Result>> {
  ResultsNotifier() : super([]);

  void addResult(Result result) {
    state = [...state, result];
  }

  void removeResult(Result result) {
    state = state
        .where((curResult) => curResult.courseCode != result.courseCode)
        .toList();
  }
}

final resultsProvider =
    StateNotifierProvider<ResultsNotifier, List<Result>>((ref) {
  return ResultsNotifier();
});
