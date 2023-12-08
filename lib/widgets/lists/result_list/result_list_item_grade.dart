import 'package:flutter/material.dart';

class ResultListItemGrade extends StatelessWidget {
  const ResultListItemGrade({
    super.key,
    required this.grade,
  });

  final String grade;

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      grade,
      style: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

    if (grade == "Pending") {
      content = const Icon(Icons.new_label_rounded);
    }

    return Container(
      width: 40,
      height: 40,
      // margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      decoration: BoxDecoration(
        color:
            Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: content,
      ),
    );
  }
}
