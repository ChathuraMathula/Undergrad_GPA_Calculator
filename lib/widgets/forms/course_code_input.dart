import 'package:flutter/material.dart';

class CourseCodeInput extends StatelessWidget {
  const CourseCodeInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
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
