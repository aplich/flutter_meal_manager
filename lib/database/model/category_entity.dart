import 'package:meal_manager/model/category.dart';

class CategoryEntity {
  int? id;
  final String name;

  CategoryEntity({required this.name});
  CategoryEntity.withId({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  Category toCategory() {
    return Category.withId(id: id, name: name);
  }

  @override
  String toString() {
    return 'MealCategory{id: $id, name: $name}';
  }
}
