import 'package:flutter/material.dart';
import 'package:meal_manager/categories_screen.dart';
import 'package:meal_manager/database/repository.dart';
import 'package:meal_manager/database/sql_repository.dart';
import 'package:meal_manager/meal_screen.dart';
import 'package:meal_manager/stats_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final repository = Repository(SqlRepository.instance);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      onTap: (index) {
        if (index == 0) {
          // Navigator.pushNamed(
          //   context,
          //   '/meal',
          //   arguments: {'disableAnimation': true},
          // );
          // Navigator.pushNamed(context, '/meal');
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => MealScreen(repository: repository,),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  CategoriesScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => StatsScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }
      },
    );
  }
}
