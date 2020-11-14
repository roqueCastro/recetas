import 'package:flutter/material.dart';
import 'package:recetas/src/screens/LoginPage.dart';
import 'package:recetas/src/screens/MyHomePage.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recetas",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        accentColor: Colors.cyan[300]
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => LoginPage(),
      },
    );
  }
}