// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidets extends StatelessWidget {
  final Item item;

  const ItemWidets({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => print("Selected item: ${item.name}"),
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          '\$${item.price.toString()}',
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
