import 'package:flutter/material.dart';
import 'package:masterchef/classes/meal.dart';
import './favourites.dart';

class reciepe_screen extends StatefulWidget {
  @override
  State<reciepe_screen> createState() => _reciepe_screenState();
}

class _reciepe_screenState extends State<reciepe_screen> {
  void addtofav(String id) {
    setState(() {
      favourites.favids.add(id);
    });
  }

  void delfromfav(String id) {
    setState(() {
      favourites.favids.remove(id);
    });
  }

  bool isPresent(String id) {
    for (var str in favourites.favids) {
      print("$str $id");
      if (str == id) return true;
    }
    return false;
  }

  bool status = false;

  @override
  Widget build(BuildContext context) {
    var routeargs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Meal>;
    Meal meal = routeargs['Meal']!;
    status = isPresent(meal.id);
    return Scaffold(
      appBar: appbar(meal.title),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(meal.imageUrl),
            ),
          ),
        ),
        Divider(),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Ingredients used ".toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.pink),
            ),
          ),
        ),
        ...ingredientslist(meal),
        Divider(),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "STEPS ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.pink),
            ),
          ),
        ),
        ...steps(meal),
      ]),
      floatingActionButton: FloatingActionButton(
        child: (status == true)
            ? Icon(Icons.favorite, color: Colors.red)
            : Icon(
                Icons.favorite_outline_sharp,
                color: Colors.red,
              ),
        onPressed: () =>
            {(status == true) ? delfromfav(meal.id) : addtofav(meal.id)},
        backgroundColor: Colors.yellow,
      ),
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

  List<Widget> ingredientslist(Meal meal) {
    List<Widget> list = [];
    int i = 1;
    for (var ing in meal.ingredients) {
      list.add(
        Container(
            padding: EdgeInsets.all(10).copyWith(left: 15),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text("$i"),
                  backgroundColor: Colors.yellow,
                ),
                Container(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "$ing",
                        style: TextStyle(fontSize: 14),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            )),
      );
      i++;
    }

    return list;
  }

  List<Widget> steps(Meal meal) {
    List<Widget> list = [];
    int i = 1;
    for (var Steps in meal.steps) {
      list.add(
        Container(
            padding: EdgeInsets.all(10).copyWith(left: 15),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text("$i"),
                  backgroundColor: Colors.yellow,
                ),
                Container(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "$Steps",
                        style: TextStyle(fontSize: 14),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            )),
      );
      i++;
    }

    return list;
  }
}
