import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/models/gpa.dart';
import 'package:undergrad_tracker/models/result.dart';
import 'package:undergrad_tracker/providers/results_provider.dart';

final gpaProvider = Provider(
  (ref) {
    List<Result> results = ref.watch(resultsProvider);

    if (results.isEmpty) {
      return Gpa(overAllGpa: 0.00);
    }

    double overAllGpaCredits = 0;
    double overAllGradePoints = 0;

    for (final result in results) {
      overAllGpaCredits += result.gpaCredits;
      overAllGradePoints += result.gradePoints;
    }

    double gpaValue = overAllGradePoints / overAllGpaCredits;

    if (gpaValue.isNaN) {
      return Gpa(overAllGpa: 0.00);
    }

    return Gpa(overAllGpa: gpaValue);
  },
);
