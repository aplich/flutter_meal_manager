import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meal_manager/app_bar.dart';
import 'package:meal_manager/database/repository.dart';
import 'package:meal_manager/model/meal.dart';
import 'package:meal_manager/my_bottom_navigation_bar.dart';

class MealScreen extends StatefulWidget {
  final Repository repository;
  final random = Random();

  MealScreen({required this.repository});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late List<Meal> mealList = [];

  @override
  void initState() {
    super.initState();
    loadMeals();
  }

  Future<void> loadMeals() async {
    final meals = await widget.repository.getAllMeals();
    setState(() {
      mealList = meals;
    });
  }

  Widget mapMeal(Meal meal) {
    return Dismissible(
      key: Key(meal.id.toString()),
      onDismissed: (direction) {
        widget.repository.removeMeal(meal.id!);
        setState(() {
          mealList.remove(meal);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Meal deleted: ${meal.name}"),
          ),
        );
      },
      background: Container(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Text(meal.name),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Meals', context),
      body: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (BuildContext context, int index) {
          return mapMeal(mealList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newMeal = Meal(name: 'New meal ${widget.random.nextInt(9000)}');
          widget.repository.addMeal(newMeal);

          setState(() {
            loadMeals();
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
