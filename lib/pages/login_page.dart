// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:catalog_app/utils/buttons.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../utils/buttons.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/login.png',
              fit: BoxFit.fitWidth,
              // height: 600,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Welcome$username",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (str) => setState(() {
                      username = '! $str';
                      if (username == '! ') username = '';
                    }),
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter your username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter Your password",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyButton('Log In'),
            // ElevatedButton(
            //   child: Text("Log in"),
            //   style: TextButton.styleFrom(
            //     minimumSize: Size(90, 45),
            //   ),
            //   onPressed: () => Navigator.pushNamed(context, MyRoutes.homeRoute),
            // ),
          ],
        ),
      ),
    );
  }
}
