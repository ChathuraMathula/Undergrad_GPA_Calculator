import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Results"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("GPA"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
