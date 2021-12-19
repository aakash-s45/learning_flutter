// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';

// ignore: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sum = ThemeMode.light;
  void fun() => setState(() {
        if (sum == ThemeMode.light)
          sum = ThemeMode.dark;
        else
          sum = ThemeMode.light;
      });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: sum,
      darkTheme: ThemeData(brightness: Brightness.dark),
      // home: HomePage(sum, fun),
      routes: {
        '/': (context) => Login(),
        '/home': (context) => HomePage(sum, fun),
        '/login': (context) => Login(),
      },
    );
  }
}
