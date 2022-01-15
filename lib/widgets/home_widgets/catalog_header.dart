// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "My Products",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
