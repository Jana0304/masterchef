import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:masterchef/widgets/food_list.dart';
import 'package:masterchef/widgets/items_list.dart';
import '../classes/meal.dart';
import '../extras/dummy_data.dart';

class favourites extends StatelessWidget {
  static Set<String> favids = {};
  List<Meal> favmeallist(Set<String> fav) {
    List<Meal> list = [];
    for (var meal in DUMMY_MEALS) {
      if (favids.contains(meal.id)) {
        list.add(meal);
      }
    }
    return list;
  }

  Widget build(BuildContext context) {
    return (favids.isEmpty)
        ? const Center(
            child: Text(
              "No favourites",
              style: TextStyle(fontSize: 15),
            ),
          )
        : foodlistwidget(ctx: context, meallist: favmeallist(favids));
  }
}
