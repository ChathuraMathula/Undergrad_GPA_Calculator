import 'package:flutter/material.dart';
import 'package:undergrad_tracker/models/grade.dart';

// const grades = [
//   "Pending",
//   "A+",
//   "A",
//   "A-",
//   "B+",
//   "B",
//   "B-",
//   "C+",
//   "C",
//   "C-",
//   "D+",
//   "D-",
//   "E",
// ];

const List<Grade> grades = Grade.values;

class CourseGradeInput extends StatelessWidget {
  const CourseGradeInput(
      {super.key, required this.onSelected, this.initialValue});

  final void Function(Grade?) onSelected;
  final Grade? initialValue;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 115,
      initialSelection: initialValue,
      onSelected: (selectedGrade) {
        onSelected(selectedGrade);
      },
      label: const Text("Grade"),
      dropdownMenuEntries: [
        for (final grade in grades)
          DropdownMenuEntry(value: grade, label: grade.text),
      ],
    );
  }
}
