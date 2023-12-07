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
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Exam Results"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              addCourseResult(context);
            },
          ),
        ],
      ),
      body: const ResultList(),
    );
  }
}
