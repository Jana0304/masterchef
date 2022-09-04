import 'package:flutter/material.dart';
import 'package:masterchef/widgets/favourites.dart';

import '../classes/category.dart';
import '../extras/dummy_data.dart';
import '../widgets/category_widget.dart';

class bottomtabbar extends StatefulWidget {
  const bottomtabbar({Key? key}) : super(key: key);

  @override
  State<bottomtabbar> createState() => _bottomtabbarState();
}

class _bottomtabbarState extends State<bottomtabbar> {
  void indexsetter(int ind) {
    setState(() {
      index = ind;
    });
  }

  @override
  var bodies = [itemsgridview(), favourites()];
  var titles = ["Master chef", "Favourites"];
  var index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: bodies[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        currentIndex: index,
        onTap: indexsetter,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favourites"),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white60,
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: Text("Master Chef"),
      backgroundColor: Color.fromARGB(255, 172, 233, 30),
      foregroundColor: const Color.fromARGB(255, 64, 83, 255),
    );
  }
}

class itemsgridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MediaQueryData mediaquery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: [...listGenerator(DUMMY_CATEGORIES)]

          ///here the three dots is knowns as spreader used to spread the list into individual elements
          ),
    );
  }

  ///code to convert the category class data into categoryWidget and add them to a list of widgets and return the widget
  List<Widget> listGenerator(List<Category> list) {
    List<Widget> CategoryList = [];
    for (var item in list) {
      CategoryList.add(CategoryWidget(
        cat: item,
      ));
    }
    return CategoryList;
  }
}
