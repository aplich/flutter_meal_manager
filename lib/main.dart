import 'package:flutter/material.dart';
import 'package:meal_manager/categories_screen.dart';
import 'package:meal_manager/database/repository.dart';
import 'package:meal_manager/database/sql_repository.dart';
import 'package:meal_manager/meal_screen.dart';
import 'package:meal_manager/stats_screen.dart';

void main() {
  final repository = Repository(SqlRepository.instance);

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),
      home: Home(repository: repository),
      initialRoute: '/meal',
      routes: {
        '/meal': (context) => MealScreen(repository: repository,),
        '/categories': (context) => CategoriesScreen(),
        '/stats': (context) => StatsScreen()
      },
      // navigatorKey: navigatorKey,
    ),
  );
}

class Home extends StatefulWidget {
  final Repository repository;

  const Home({required this.repository});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealScreen(repository: widget.repository),
    );
  }
}
