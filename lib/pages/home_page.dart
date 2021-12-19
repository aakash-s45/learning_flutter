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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(child: const Text("hello"), onPressed: fun),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child:
                  ElevatedButton(child: const Text("hello1"), onPressed: fun),
            ),
          ],
        ),
      ),
    );
  }
}
