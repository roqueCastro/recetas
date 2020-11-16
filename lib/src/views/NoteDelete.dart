import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text("Deseas eliminar esta nota?."),
      actions: <Widget>[
        FlatButton(
          child: Text("Si"),
          onPressed: (){
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text("No"),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        )
      ],

    );
  }

}