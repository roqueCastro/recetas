import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recetas/src/views/Note/NoteList.dart';
import 'package:recetas/src/views/Note/NoteModify.dart';
import 'package:recetas/src/views/Search/Searched.dart';



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
              case "/modify":
                String id = settings.arguments;
                return NoteModify(idNote: id,);
              case "/food":
                return Searched();


              default:
                return Scaffold(body: Center(
                  child: Text("Not route..!",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 70),),
                ),);
            }
          }
        );
      },
    );
  }
}