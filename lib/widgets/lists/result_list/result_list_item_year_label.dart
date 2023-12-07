import 'package:flutter/material.dart';
import 'package:undergrad_tracker/utils/color_utils.dart';

class ResultListItemYearLabel extends StatelessWidget {
  const ResultListItemYearLabel({super.key, required this.courseYear});

  final String courseYear;

  @override
  Widget build(BuildContext context) {
    Color color = getColorByCourseYear(courseYear);

    return Container(
      height: 18,
      width: 70,
      // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Year $courseYear',
          style: const TextStyle().copyWith(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
