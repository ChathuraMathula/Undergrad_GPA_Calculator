import 'package:flutter/material.dart';

class CourseYearInput extends StatelessWidget {
  const CourseYearInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      controller: controller,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      label: const Text("Year"),
      dropdownMenuEntries: [
        for (var i = 1; i <= 6; i++) DropdownMenuEntry(value: i, label: '$i'),
      ],
    );
  }
}
