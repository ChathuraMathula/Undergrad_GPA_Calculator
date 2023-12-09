import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/widgets/drawer/app_drawer.dart';
import 'package:undergrad_tracker/widgets/forms/add_new_result.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  addCourseResult(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (ctx) {
          return const AddNewResult();
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(
        resultsSelected: true,
      ),
      appBar: AppBar(
        title: Text(
          "Exam Results",
          style: const TextStyle().copyWith(
            fontSize: 18,
          ),
        ),
        actions: [
          Container(
            width: 100,
            margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: ElevatedButton.icon(
              style: const ButtonStyle().copyWith(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.inversePrimary,
                ),
                shadowColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                foregroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              onPressed: () {
                addCourseResult(context);
              },
              icon: const Icon(Icons.add),
              label: Text(
                "Add",
                style: const TextStyle().copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const ResultList(),
    );
  }
}
