// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_detail.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';

class CatlogList extends StatelessWidget {
  const CatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetail(catalog: catalog),
                  )),
              child: CatalogItem(catalog: catalog)),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).canvasColor,
      ),
      height: 150,
      width: 100,
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                catalog.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: MyTheme.darkColor),
              ),
              Text(
                catalog.desc,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                children: [
                  Text(
                    '\$${catalog.price.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    onPressed: () {},
                    child: Text("Buy"),
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(5),
        child: Image.network(
          image,
        ),
      ),
    );
  }
}
