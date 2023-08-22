import 'package:flutter/material.dart';
import 'package:meal_manager/app_bar.dart';
import 'package:meal_manager/my_bottom_navigation_bar.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Categories', context),
      body: const Center(
        child: Text('Categories Screen Content'),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
