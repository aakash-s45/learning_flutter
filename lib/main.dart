// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sum = ThemeMode.light;
  void fun() => setState(() {
        if (sum == ThemeMode.light) {
          sum = ThemeMode.dark;
          print("changed to dark");
        } else {
          sum = ThemeMode.light;
          print("changed to light");
        }
      });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      themeMode: sum,
      darkTheme: MyTheme.darkTheme,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => Login(),
        MyRoutes.homeRoute: (context) => HomePage(sum, fun),
        MyRoutes.loginRoute: (context) => Login(),
      },
    );
  }
}
