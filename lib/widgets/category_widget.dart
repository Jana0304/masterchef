////deals with single widget category

import 'package:flutter/material.dart';

import '../classes/category.dart';
import 'items_list.dart';

class CategoryWidget extends StatelessWidget {
  final Category cat;
  const CategoryWidget({Key? key, required this.cat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => itemlistfunction(context),
      child: Container(
        decoration: BoxDecoration(
          color: cat.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: FittedBox(
                child: Text(
          cat.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ))),
      ),
    );
  }

  //function that paints list view on the screen

  void itemlistfunction(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('items_list',
        arguments: {'id': cat.id, "category": cat.title});
  }
}
