import 'package:flutter/material.dart';

class CourseCreditsInput extends StatelessWidget {
  const CourseCreditsInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        maxLength: 2,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Credits",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
