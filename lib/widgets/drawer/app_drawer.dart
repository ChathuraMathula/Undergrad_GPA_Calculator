import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/screens/gpa_screen.dart';
import 'package:undergrad_tracker/screens/results_screen.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Results"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ResultsScreen()),
                );
              },
            ),
            ListTile(
              title: const Text("GPA"),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => GpaScreen()),
                // );
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const GpaScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
