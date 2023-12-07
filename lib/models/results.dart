import 'package:undergrad_tracker/models/result.dart';

class Results {
  Results._privateConstructor();

  static final _resultsInstance = Results._privateConstructor();

  factory Results() {
    return _resultsInstance;
  }

  final List<Result> _resultList = [];

  set addResult(Result result) {
    _resultList.add(result);
  }

  List<Result> get list {
    return _resultList;
  }
}
