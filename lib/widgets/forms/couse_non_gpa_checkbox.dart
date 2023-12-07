import 'package:flutter/material.dart';

class CourseNonGpaCheckbox extends StatelessWidget {
  const CourseNonGpaCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
            ),
            const Text("Non-GPA"),
          ],
        ),
      ],
    );
  }
}
