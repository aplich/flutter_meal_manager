import 'package:flutter/material.dart';
import 'package:meal_manager/app_settings_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String viewName;
  final BuildContext context;

  const MyAppBar(this.viewName, this.context);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        viewName,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppSettingsScreen()),
            );
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
