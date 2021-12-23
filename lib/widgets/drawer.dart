// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback fun;
  MyDrawer(this.fun);

  @override
  Widget build(BuildContext context) {
    // final imageURL = 'file:///Users/aakash/Downloads/file.png';
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Aks"),
                accountEmail: Text("tech2aks@gmail.com"),
                // currentAccountPicture: Image.asset('images/file.png'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/file.png'),
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text("Mail"),
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.black,
              ),
            ),
            ElevatedButton(child: Text("hello"), onPressed: fun),
          ],
        ),
      ),
    );
  }
}