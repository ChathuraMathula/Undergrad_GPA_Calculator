import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:undergrad_tracker/models/result.dart';
import 'package:undergrad_tracker/utils/color_utils.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list_item_course_code.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list_item_credits.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list_item_grade.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list_item_non_gpa_label.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list_item_year_label.dart';

class ResultListItem extends StatelessWidget {
  const ResultListItem({super.key, required this.result});

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      decoration: const BoxDecoration().copyWith(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            spreadRadius: 0.3,
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            offset: Offset.fromDirection(0.2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            padding: EdgeInsets.all(6),
            child: Center(
              child: Container(
                width: 8,
                decoration: const BoxDecoration().copyWith(
                  color: getColorByCourseYear(result.courseYear),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResultListItemCourseCode(courseCode: result.courseCode),
                  ResultListItemYearLabel(courseYear: result.courseYear),
                  ResultListItemNonGpaLabel(isNonGpa: result.isNonGPA),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResultListItemGrade(grade: result.grade),
                  ResultListItemCredits(credits: result.credits),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
