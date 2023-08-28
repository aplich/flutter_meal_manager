import 'package:meal_manager/database/model/meal_entity.dart';
import 'package:meal_manager/database/sql_repository.dart';
import 'package:meal_manager/model/meal.dart';

class Repository {
  final SqlRepository _sqlRepository;

  Repository(this._sqlRepository);

  Meal? getMeal(int id) {
    Meal? meal;
    _sqlRepository.getMealById(id).then((entity) {
      meal = entity?.toMeal();
    });

    return meal;
  }

  // List<Meal> getAllMeals() {
  //   final List<Meal> mealList = [];
  //   _sqlRepository.getAllMeals().then((meals) {
  //     for (final element in meals) {
  //       mealList.add(element.toMeal());
  //     }
  //   });
  //   return mealList;
  // }

  Future<List<Meal>> getAllMeals() async {
    final List<Meal> mealList = [];
    final List<MealEntity> mealEntities = await _sqlRepository.getAllMeals();

    for (final entity in mealEntities) {
      mealList.add(entity.toMeal());
    }

    return mealList;
  }


  void addMeal(Meal meal) {
    _sqlRepository.insertMeal(MealEntity.fromMeal(meal));
  }

  void removeMeal(int mealId) {
    _sqlRepository.deleteMeal(mealId);
  }

  void updateMeal(Meal meal) {
    _sqlRepository.updateMeal(MealEntity.fromMeal(meal));
  }
}
