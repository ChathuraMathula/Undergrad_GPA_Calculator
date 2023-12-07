import 'package:flutter/material.dart';
import 'package:undergrad_tracker/screens/results_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My app",
      home: ResultsScreen(),
    );
  }
}
