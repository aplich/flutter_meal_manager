class Meal {
  int? id;
  final String name;

  Meal({required this.name});
  Meal.withId({required this.name, required this.id});

  @override
  String toString() {
    return 'Meal{id: $id, name: $name}';
  }
}
