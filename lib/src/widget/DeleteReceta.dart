import 'package:flutter/material.dart';

//FUNTIONS
typedef OnCloseSession = Function(bool closeSession);

class DeleteReceta extends StatelessWidget{
  //
  final OnCloseSession onCloseSession;

  DeleteReceta({@required this.onCloseSession});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Cerra sesión"),
      contentPadding: EdgeInsets.all(10.0),
      actions: <Widget>[
        FlatButton(
          child: Text("CANCEL"),
          color: Colors.transparent,
          textColor: Colors.black,
          onPressed: () {
            this.onCloseSession(false);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("OK"),
          color: Theme.of(context).primaryColor,
          splashColor: Colors.purple,
          textColor: Colors.white,
          onPressed: () {
            this.onCloseSession(true);
            Navigator.of(context).pop();
          },
        ),

      ],
    );
    }
}