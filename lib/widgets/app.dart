import 'package:flutter/material.dart';
import 'package:undergrad_tracker/screens/results_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 6, 180, 0),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onPrimary,
        ),
      ),
      title: "My app",
      home: const ResultsScreen(),
    );
  }
}
