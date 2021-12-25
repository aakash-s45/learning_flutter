// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import '../models/catalog.dart';

class HomePage extends StatelessWidget {
  var sum;
  final VoidCallback fun;
  HomePage(this.sum, this.fun);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemWidets(
            item: CatalogModel.items[index],
          );
        },
      ),
      drawer: MyDrawer(fun),
    );
  }
}
