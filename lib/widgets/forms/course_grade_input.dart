import 'package:flutter/material.dart';

const grades = [
  "Pending",
  "A+",
  "A",
  "A-",
  "B+",
  "B",
  "B-",
  "C+",
  "C",
  "C-",
  "D+",
  "D-",
  "E",
];

class CourseGradeInput extends StatelessWidget {
  const CourseGradeInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 115,
      controller: controller,
      label: const Text("Grade"),
      dropdownMenuEntries: [
        for (final grade in grades)
          DropdownMenuEntry(value: grade, label: grade),
      ],
    );
  }
}
