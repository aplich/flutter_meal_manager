import 'package:meal_manager/model/meal.dart';

class MealEntity {
  int? id;
  final String name;

  MealEntity({required this.name});
  MealEntity.withId({required this.name, required this.id});
  MealEntity.fromMeal(Meal meal)
      : id = meal.id,
        name = meal.name;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  Meal toMeal() {
    return Meal.withId(name: name, id: id);
  }

  @override
  String toString() {
    return 'Meal{id: $id, name: $name}';
  }
}
