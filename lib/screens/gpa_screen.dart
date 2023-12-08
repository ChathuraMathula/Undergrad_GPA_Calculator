import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/providers/gpa_provider.dart';
import 'package:undergrad_tracker/widgets/drawer/app_drawer.dart';

class GpaScreen extends ConsumerStatefulWidget {
  const GpaScreen({super.key});

  @override
  ConsumerState<GpaScreen> createState() {
    return _GpaScreenState();
  }
}

class _GpaScreenState extends ConsumerState<GpaScreen> {
  @override
  Widget build(BuildContext context) {
    final gpa = ref.watch(gpaProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          "GPA",
          style: const TextStyle().copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: Text('${gpa.overAllGpa}'),
    );
  }
}
