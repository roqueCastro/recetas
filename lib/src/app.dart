import 'package:flutter/material.dart';
import 'package:recetas/src/views/LoginPage.dart';
import 'package:recetas/src/views/NoteList.dart';
import 'package:recetas/src/views/NoteModify.dart';



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
      // initialRoute: "/",
      // routes: {
      //   "/": (BuildContext context) => LoginPage(_serverController, context),
      //   "/home": (BuildContext context) => MyHomePage(),
      // },
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context){
            switch(settings.name){
              case "/":
                return NoteList();
              case "/logueo":
                return LoginPage();
              case "/modify":
                String id = settings.arguments;
                return NoteModify(idNote: id,);
            }
          }
        );
      },
    );
  }
}