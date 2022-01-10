// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  var sum;
  final VoidCallback fun;
  HomePage(this.sum, this.fun);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJSON =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData['products'];
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          // itemCount: CatalogModel.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidets(
              item: dummylist[index],
              // item: CatalogModel.items[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(widget.fun),
    );
  }
}
