import 'package:flutter/material.dart';

class ResultListItemCourseCode extends StatelessWidget {
  const ResultListItemCourseCode({super.key, required this.courseCode});

  final String courseCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(
        courseCode,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
