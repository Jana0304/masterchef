/////MAIN PAGE

import 'package:flutter/material.dart';
import 'package:masterchef/widgets/items_list.dart';

import '../extras/dummy_data.dart';
import '../classes/category.dart';
import 'category_widget.dart';

class homepage extends StatelessWidget {
  var title = "Mad Chef";

  //AppBar  implementation
  AppBar appbar() {
    return AppBar(
      title: Text(title),
      backgroundColor: Color.fromARGB(255, 192, 233, 30),
      foregroundColor: const Color.fromARGB(255, 64, 83, 255),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: null,
    );
  }
}
