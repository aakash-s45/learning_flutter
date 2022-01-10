// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_null_comparison

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
    await Future.delayed(Duration(seconds: 3));
    final catalogJSON =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    child: GridTile(
                      child: Image.network(item.image),
                      header: Text(item.name),
                      footer: Text(item.price.toString()),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )

            // child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            //     ? ListView.builder(
            //         itemCount: CatalogModel.items.length,
            //         itemBuilder: (BuildContext context, int index) =>
            //             ItemWidets(item: CatalogModel.items[index]),
            //       )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(widget.fun),
    );
  }
}
