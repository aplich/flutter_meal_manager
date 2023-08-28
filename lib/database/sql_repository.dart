import 'package:meal_manager/database/model/meal_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlRepository {
  static final SqlRepository instance = SqlRepository._privateConstructor();
  static Database? _database;

  SqlRepository._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'meal_manager.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meal (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
  }

  Future<void> insertMeal(MealEntity mealEntity) async {
    final db = await database;
    await db.insert(
      'meal',
      {'name': mealEntity.name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<MealEntity?> getMealById(int mealId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'meal',
      where: 'id = ?',
      whereArgs: [mealId],
    );

    if (maps.isNotEmpty) {
      return MealEntity.withId(
        id: maps[0]['id'] as int,
        name: maps[0]['name'] as String,
      );
    }

    return null;
  }

  Future<List<MealEntity>> getAllMeals() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('meal');

    return List.generate(maps.length, (i) {
      return MealEntity.withId(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
      );
    });
  }

  Future<void> deleteMeal(int mealId) async {
    final db = await database;
    await db.delete(
      'meal',
      where: 'id = ?',
      whereArgs: [mealId],
    );
  }

  Future<void> updateMeal(MealEntity updatedMeal) async {
    final db = await database;
    await db.update(
      'meal',
      updatedMeal.toMap(),
      where: 'id = ?',
      whereArgs: [updatedMeal.id],
    );
  }
}
