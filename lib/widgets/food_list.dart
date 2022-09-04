import 'package:flutter/material.dart';
import 'package:masterchef/classes/meal.dart';

class foodlistwidget extends StatelessWidget {
  BuildContext ctx;
  List<Meal> meallist;
  foodlistwidget({required this.ctx, required this.meallist});

  Widget build(BuildContext ctx) {
    return ListView.builder(
        itemCount: meallist.length,
        itemBuilder: (ctx, ind) {
          return Container(
              padding: const EdgeInsets.all(10),
              child: designforMealinListitem(meallist[ind], ctx));
        });
  }

  Widget designforMealinListitem(Meal meal, BuildContext ctx) {
    return InkWell(
        onTap: () => {
              Navigator.of(ctx)
                  .pushNamed('reciepe_screen', arguments: {'Meal': meal}),
            },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            shadowColor: Colors.black,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(meal.imageUrl),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 220,
                        color: Colors.black54,
                        padding: EdgeInsets.all(8),
                        child: Text(
                          meal.title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            Text("${meal.duration} min"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            Text("${meal.complexity.name}"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.money),
                            Text("${meal.affordability.name}"),
                          ],
                        ),
                      ],
                    ))
              ],
            )));
  }
}
