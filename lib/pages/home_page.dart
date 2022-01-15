// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables

import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';

import 'package:catalog_app/models/catalog.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(CupertinoIcons.cart),
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: CatlogList(),
                  ),
                )
              else
                Expanded(child: Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
