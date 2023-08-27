import 'package:flutter/material.dart';
import 'package:meal_manager/categories_screen.dart';
import 'package:meal_manager/meal_screen.dart';
import 'package:meal_manager/stats_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),
      home: Home(),
      initialRoute: '/meal',
      routes: {
        '/meal': (context) => MealScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/stats': (context) => StatsScreen()
      },
    ),
  );
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealScreen(),
    );
  }
}
