import 'package:flutter/material.dart';

class ResultListItemNonGpaLabel extends StatelessWidget {
  const ResultListItemNonGpaLabel({super.key, required this.isNonGpa});

  final bool isNonGpa;

  @override
  Widget build(BuildContext context) {
    Widget content = const SizedBox(
        // height: 16,
        // width: 55,
        );

    if (isNonGpa) {
      content = Container(
        height: 16,
        width: 55,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Non-GPA",
            style: const TextStyle().copyWith(
              fontSize: 8,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      );
    }

    return content;
  }
}
