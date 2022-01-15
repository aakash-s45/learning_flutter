// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import '../utils/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  bool cond = false;
  final _formkey = GlobalKey<FormState>();

  void moveToHome() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        cond = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        cond = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.fitWidth,
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
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be empty";
                        } else {
                          return null;
                        }
                      },
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
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        } else if (value.length < 4) {
                          return "Password length should be at least 6";
                        } else {
                          return null;
                        }
                      },
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
              Material(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(cond ? 25 : 5),
                child: InkWell(
                  onTap: () => moveToHome(),
                  child: AnimatedContainer(
                    duration: Duration(microseconds: 200),
                    width: cond ? 50 : 100,
                    height: 50,
                    alignment: Alignment.center,
                    child: cond
                        ? Icon(
                            Icons.done,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : Text(
                            "Log in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                  ),
                ),
              )

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
      ),
    );
  }
}
