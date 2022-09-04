import 'package:flutter/material.dart';
import 'package:masterchef/extras/dummy_data.dart';
import 'package:masterchef/widgets/food_list.dart';
import 'package:masterchef/widgets/reciepe_screen.dart';
import './favourites.dart';

import '../classes/meal.dart';

class items_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var category = routeArgs['category'];
    var id = routeArgs['id'];
    List<Meal> meallistofthiscategory = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: appbar(category!),
      backgroundColor: Theme.of(context).backgroundColor,
      body: foodlistwidget(ctx: context, meallist: meallistofthiscategory),
    );
  }

  AppBar appbar(String category) {
    return AppBar(
      title: FittedBox(
        child: Text(
          category,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 233, 233, 30),
      foregroundColor: const Color.fromARGB(255, 64, 83, 255),
    );
  }
}
