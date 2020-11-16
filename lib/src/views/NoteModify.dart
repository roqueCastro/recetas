import 'package:flutter/material.dart';
import 'package:recetas/src/models/Note.dart';

class NoteModify extends StatelessWidget {

  String idNote;

  bool get isEditing => idNote == null;

  NoteModify(this.idNote, {Key key}): super (key: key);



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Create note": "Edit note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Example: Nota 1",
                ),
              ),
              SizedBox(height: 25,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Content",
                  hintText: "Example: Impresa......",
                ),
              ),
              SizedBox(height: 10,),
              RaisedButton(
                elevation: 2,
                child: Text("Registrar"),
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}