import 'package:flutter/material.dart';
import 'package:meal_manager/meal_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),
      home: Home(),
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
