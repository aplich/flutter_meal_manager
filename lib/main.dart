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
      initialRoute: '/',
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
  late final MealScreen _mealScreen;
  late final CategoriesScreen _categoriesScreen;
  late final StatsScreen _statsScreen;

  static List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    super.initState();
    _mealScreen = MealScreen(repository: widget.repository);
    _categoriesScreen = CategoriesScreen();
    _statsScreen = StatsScreen();

    _pages = <Widget>[
      _mealScreen,
      _categoriesScreen,
      _statsScreen,
    ];
  }



  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Stats',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

    );
  }
}
