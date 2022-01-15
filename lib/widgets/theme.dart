// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        cardColor: Colors.white,
        canvasColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: creamColor,
          secondary: darkColor,
          primaryVariant: creamColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: darkColor),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
      );
  static ThemeData get darkTheme => ThemeData(
        // brightness: Brightness.dark,
        cardColor: MyTheme.darkColor,
        canvasColor: Colors.white,
        colorScheme: ColorScheme.dark(
          primary: darkColor,
          secondary: Colors.yellow.shade300,
          primaryVariant: Colors.yellow.shade300,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.yellow.shade300),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
      );

  static Color lightColor = Colors.yellow.shade300;
  static Color darkColor = Colors.indigo.shade900;
  // static Color creamColor = Colors.yellow.shade300;
  static Color creamColor = Color(0xfff7f6f5);
  static Color grayColor = Colors.grey.shade900;
}
