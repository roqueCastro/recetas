import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recetas/src/app.dart';
import 'package:recetas/src/models/Note.dart';
import 'package:recetas/src/services/ServiceNote.dart';
import 'package:recetas/src/views/NoteDelete.dart';

class NoteList extends StatefulWidget{

  @override
  _NoteList createState() => _NoteList();
}

class _NoteList extends State<NoteList> {

  ServiceNote get servicesNote => GetIt.I<ServiceNote>();
  List<Note> notes = [];

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de notas"),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green,),
        itemCount: notes.length,
        itemBuilder: (_, index){

          return Dismissible(
            key: ValueKey(notes[index].id),
            direction: DismissDirection.startToEnd,
            onDismissed: (direccion){

            },
            confirmDismiss: (direciton)async{
              final result = await showDialog(
                context: context,
                builder: (_) => NoteDelete(),
              );

              return result;
            },
            background: Container(
              color: Colors.red,
              child: Align(alignment: Alignment.centerLeft,child: Icon(Icons.delete, color:  Colors.white,),),
            ),
            child: ListTile(
              title: Text(notes[index].title, style: TextStyle(color: Theme.of(context).primaryColor),),
              subtitle: Text("Last edited on ${formatDateTime(notes[index].lastEditdateTime)}", ),
              onTap: (){
                Navigator.of(context).pushNamed("/modify", arguments: notes[index].id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed("/modify");
        },
      ),
    );
  }



  //************METODOS INIT**************
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    notes = servicesNote.getNoteList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}



  
