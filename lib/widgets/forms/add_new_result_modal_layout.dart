import 'package:flutter/material.dart';

class AddNewResultModalLayout extends StatelessWidget {
  const AddNewResultModalLayout({
    super.key,
    required this.courseCodeInput,
    required this.courseYearInput,
    required this.courseGradeInput,
    required this.courseCreditsInput,
    required this.courseNonGpaCheckbox,
    required this.modalActions,
    required this.title,
  });

  final Widget courseCodeInput;
  final Widget courseYearInput;
  final Widget courseGradeInput;
  final Widget courseCreditsInput;
  final Widget courseNonGpaCheckbox;
  final Widget modalActions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseCodeInput,
              const SizedBox(width: 8),
              courseYearInput,
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseNonGpaCheckbox,
              const SizedBox(width: 12),
              courseCreditsInput,
              const SizedBox(width: 8),
              courseGradeInput,
            ],
          ),
          const SizedBox(height: 16),
          modalActions,
        ],
      ),
    );
  }
}
