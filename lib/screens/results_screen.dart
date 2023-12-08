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
      drawer: const AppDrawer(),
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
                  Theme.of(context).colorScheme.primary,
                ),
                shadowColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                foregroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              onPressed: () {
                addCourseResult(context);
              },
              icon: const Icon(Icons.add),
              label: const Text("Add"),
            ),
          ),
        ],
      ),
      body: const ResultList(),
    );
  }
}
