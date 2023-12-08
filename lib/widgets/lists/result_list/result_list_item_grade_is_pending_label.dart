import 'package:flutter/material.dart';

class ResultListItemGradeIsPendingLabel extends StatelessWidget {
  const ResultListItemGradeIsPendingLabel({super.key, required this.grade});

  final String grade;

  @override
  Widget build(BuildContext context) {
    Widget content = const SizedBox(
        // height: 16,
        // width: 55,
        );

    if (grade == "Pending") {
      content = Container(
        height: 16,
        width: 55,
        // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Pending',
            style: const TextStyle().copyWith(
              fontSize: 8,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    return content;
  }
}
