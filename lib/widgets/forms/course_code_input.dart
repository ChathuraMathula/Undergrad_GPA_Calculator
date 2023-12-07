import 'package:flutter/material.dart';

class CourseCodeInput extends StatelessWidget {
  const CourseCodeInput({
    super.key,
    required this.controller,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        readOnly: readOnly,
        maxLength: 16,
        controller: controller,
        decoration: const InputDecoration(
          labelText: "Course Code",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
