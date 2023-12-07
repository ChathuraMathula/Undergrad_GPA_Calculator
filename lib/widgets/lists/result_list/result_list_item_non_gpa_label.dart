import 'package:flutter/material.dart';

class ResultListItemNonGpaLabel extends StatelessWidget {
  const ResultListItemNonGpaLabel({super.key, required this.isNonGpa});

  final bool isNonGpa;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      height: 20,
      width: 70,
    );

    if (isNonGpa) {
      content = Container(
        height: 18,
        width: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Non-GPA",
            style: const TextStyle().copyWith(
              fontSize: 10,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      );
    }

    return content;
  }
}
