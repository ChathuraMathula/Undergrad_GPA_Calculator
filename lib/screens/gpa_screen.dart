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
      drawer: const AppDrawer(
        gpaSelected: true,
      ),
      appBar: AppBar(
        title: Text(
          "GPA",
          style: const TextStyle().copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration().copyWith(
                // border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    spreadRadius: 0.3,
                    blurRadius: 3,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your current GPA value is,",
                    style: const TextStyle().copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    gpa.overAllGpa.toStringAsFixed(2),
                    style: const TextStyle().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
