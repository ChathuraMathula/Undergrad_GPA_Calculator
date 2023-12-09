import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/screens/gpa_screen.dart';
import 'package:undergrad_tracker/screens/results_screen.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
    this.resultsSelected = false,
    this.gpaSelected = false,
  });

  final bool resultsSelected;
  final bool gpaSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Results"),
              selected: resultsSelected,
              onTap: () {
                Navigator.of(context).pop();
                if (resultsSelected) {
                  return;
                }
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ResultsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("GPA"),
              selected: gpaSelected,
              onTap: () {
                Navigator.of(context).pop();
                if (gpaSelected) {
                  return;
                }
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const GpaScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
