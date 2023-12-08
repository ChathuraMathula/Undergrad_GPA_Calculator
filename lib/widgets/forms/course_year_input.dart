import 'package:flutter/material.dart';

class CourseYearInput extends StatelessWidget {
  const CourseYearInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 115,
      controller: controller,
      label: const Text("Year"),
      dropdownMenuEntries: [
        for (var i = 1; i <= 6; i++) DropdownMenuEntry(value: i, label: '$i'),
      ],
    );
  }
}
