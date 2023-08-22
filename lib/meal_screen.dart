import 'package:flutter/material.dart';
import 'package:meal_manager/app_bar.dart';
import 'package:meal_manager/model/meal.dart';
import 'package:meal_manager/model/meal_category.dart';
import 'package:meal_manager/my_bottom_navigation_bar.dart';

class MealScreen extends StatefulWidget {
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  int initialValue = 0;
  MealCategory mainMealCategory = MealCategory("Dinner");
  List<Meal> mealList = [];

  Widget mapMeal(Meal meal) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(meal.category.categoryName),
            ),
            Expanded(
              flex: 5,
              child: Text(meal.name),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Meals', context),
      body: Center(
        child: Column(
          children: mealList.map((meal) => mapMeal(meal)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            initialValue += 1;
            mealList.add(Meal('Dinner number $initialValue', mainMealCategory));
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
