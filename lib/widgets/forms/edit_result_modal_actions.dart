import 'package:flutter/material.dart';

class EditResultModalActions extends StatelessWidget {
  const EditResultModalActions({super.key, required this.onSave});

  final void Function() onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: onSave,
          child: const Text("Save"),
        ),
      ],
    );
  }
}
