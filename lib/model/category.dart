class Category {
  int? id;
  final String name;

  Category({required this.name});
  Category.withId({required this.id, required this.name});

  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }
}
