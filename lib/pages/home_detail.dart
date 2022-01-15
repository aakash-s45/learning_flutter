// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;
  const HomeDetail({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          children: [
            Text(
              '\$${catalog.price.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: Colors.red.shade900),
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
              child: Text("Add to Cart"),
            ).wh(120, 60)
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryVariant,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      children: [
                        Text(
                          catalog.name,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        Text(
                          catalog.desc,
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Dummytext(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Dummytext extends StatelessWidget {
  static String dummy =
      "Sit ad consequat ea minim excepteur minim Lorem fugiat tempor aute. Voluptate ex minequat ea minim excepteur minim Lorem fugiat tempor aute. Voluptate ex minim eu excepteur minim Lorem fugiat tempor aute. Voluptate ex minim eu consectetur in. Adipisicing consequat ea minim excepteur minim aliqua reprehenderit labore mollit commodo labore. Est Lorem cillum ea ad in adipisicing incididunt sit ullamco consequat nostrud cillum. Et non nisi cillum sint cillum mollit in nostrud occaecat cupidatat ipsum adipisicing deserunt sit. Eiusmod voluptate esse aute duis consequat nulla sunt ex voluptate consectetur ullamco.";
  const Dummytext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      dummy,
      overflow: TextOverflow.clip,
      style: TextStyle(
          fontSize: 17, color: Theme.of(context).colorScheme.secondary),
    );
  }
}
