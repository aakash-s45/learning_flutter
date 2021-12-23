// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var sum;
  final VoidCallback fun;
  HomePage(this.sum, this.fun);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App: $sum"),
      ),
      drawer: MyDrawer(fun),
    );
  }
}
