import 'package:flutter/material.dart';
import 'package:meal_manager/app_bar.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Stats', context),
      body: const Center(
        child: Text('Stats Screen Content'),
      ),
    );
  }
}
