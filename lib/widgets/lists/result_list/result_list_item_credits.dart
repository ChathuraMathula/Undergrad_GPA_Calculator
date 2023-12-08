import 'package:flutter/material.dart';

class ResultListItemCredits extends StatelessWidget {
  const ResultListItemCredits({super.key, required this.credits});

  final String credits;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Credits: $credits',
      style: const TextStyle().copyWith(
        fontSize: 12,
      ),
    );
  }
}
