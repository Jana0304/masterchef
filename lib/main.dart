import 'package:flutter/material.dart';

import '../widgets/reciepe_screen.dart';
import '../widgets/items_list.dart';
import '../widgets/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          brightness: Brightness.values[1],
          backgroundColor: Color.fromRGBO(200, 200, 200, 1)),
      home: bottomtabbar(),
      routes: {
        'items_list': (context) => items_list(),
        'reciepe_screen': (context) => reciepe_screen()
      },
    );
  }
}
