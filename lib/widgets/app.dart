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
        inputDecorationTheme: const InputDecorationTheme().copyWith(
          labelStyle: const TextStyle().copyWith(
            fontSize: 13,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
        ),
        dropdownMenuTheme: const DropdownMenuThemeData().copyWith(
          textStyle: const TextStyle().copyWith(
            fontSize: 13,
          ),
          inputDecorationTheme: const InputDecorationTheme().copyWith(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            contentPadding: const EdgeInsets.all(8),
            isCollapsed: true,
            constraints: BoxConstraints.tight(
              const Size.fromHeight(50),
            ),
          ),
        ),
        checkboxTheme: const CheckboxThemeData().copyWith(
          shape: const OvalBorder(),
          visualDensity: VisualDensity.comfortable
              .copyWith(horizontal: 0.5, vertical: 0.5),
        ),
        drawerTheme: const DrawerThemeData().copyWith(
          scrimColor: kColorScheme.onPrimaryContainer.withOpacity(0.5),
          shape: const ContinuousRectangleBorder(),
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          shape: const ContinuousRectangleBorder(),
        ),
      ),
      title: "My app",
      home: const ResultsScreen(),
    );
  }
}
