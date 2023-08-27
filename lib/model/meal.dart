import 'package:meal_manager/model/meal_category.dart';

class Meal {
  final String name;
  final MealCategory category;
  final int id;

  Meal(this.name, this.category, this.id);
}
