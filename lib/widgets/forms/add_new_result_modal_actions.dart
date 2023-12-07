import 'package:flutter/material.dart';

class AddNewResultModalActions extends StatelessWidget {
  const AddNewResultModalActions({super.key, required this.onEnter});

  final void Function() onEnter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: onEnter,
          child: Text("Enter"),
        ),
      ],
    );
  }
}
