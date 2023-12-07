import 'package:flutter/material.dart';

class AddResult extends StatelessWidget {
  const AddResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text("Course Code"),
            ),
          ),
        ],
      ),
    );
  }
}
