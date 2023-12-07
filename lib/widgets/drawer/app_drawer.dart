import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(6),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 120,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.percent,
              size: 30,
            ),
            title: const Text("Results"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.calculate,
              size: 30,
            ),
            title: const Text("GPA"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
