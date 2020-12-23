
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recetas/src/models/ApiResponse.dart';
import 'package:recetas/src/models/Note.dart';

import 'package:recetas/src/services/ServicesApiNote.dart';
import 'package:recetas/src/views/Note/NoteDelete.dart';
import 'package:recetas/src/views/Note/NoteModify.dart';


class NoteList extends StatefulWidget{

  @override
  _NoteList createState() => _NoteList();
}

class _NoteList extends State<NoteList> {

  ServicesApiNote get services => GetIt.I<ServicesApiNote>();
  // ServiceNote get servicesNote => GetIt.I<ServiceNote>();
  // List<Note> notes = [];

  ApiResponse<List<Note>> _apiResponse;

  bool isLoading = false;

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de notas"),
        actions: <Widget>[

          PopupMenuButton(
            onSelected: (value)=>onSelectedMenuItem(value),
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "food",
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Food'),
                ),
              ),
              const PopupMenuItem(
                value: "socks",
                child: ListTile(
                  leading: Icon(Icons.format_shapes),
                  title: Text('Socks'),
                ),
              ),
              const PopupMenuItem(
                value: "reload",
                child: ListTile(
                  leading: Icon(Icons.refresh),
                  title: Text('Reload'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text('Item A')),
              const PopupMenuItem(child: Text('Item B')),
            ],
          ),

        ],
      ),
      body: Builder(
        builder: (_){

          if(isLoading){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }

          if(_apiResponse.error){
            return Center(
              child: Text(_apiResponse.errorMessage),
            );
        }

          return ListView.separated(
            separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green,),
            itemCount: _apiResponse.data.length,
            itemBuilder: (_, index){

              return Dismissible(
                key: ValueKey(_apiResponse.data[index].id),
                direction: DismissDirection.startToEnd,
                onDismissed: (DismissDirection direccion) => dismissCard(_apiResponse.data[index]),
                confirmDismiss: (direciton)async{
                  final result = await showDialog(
                    context: context,
                    builder: (_) => NoteDelete(),
                  );

                  if(result){
                    deleteNote(_apiResponse.data[index].id);
                  }

                  return result;
                },
                background: Container(
                  color: Colors.red[300],
                  child: Align(alignment: Alignment.centerLeft,child: Icon(Icons.delete, color:  Colors.white,),),
                ),
                child: ListTile(
                  title: Text(_apiResponse.data[index].title, style: TextStyle(color: Theme.of(context).primaryColor),),
                  subtitle: Text("Last edited on ${formatDateTime(_apiResponse.data[index].lastEditdateTime)}", ),
                  onTap: (){
                    // Navigator.of(context).pushNamed("/modify", arguments: _apiResponse.data[index].id);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => NoteModify(
                          idNote: _apiResponse.data[index].id))).then(
                            (value) {
                              _fetchNotes();
                            });
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform(
            transform: Matrix4.identity()
            ..translate(0.0, -22.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              splashColor: Colors.black,
              onPressed: (){
                // Navigator.of(context).pushNamed("/modify");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteModify(
                        idNote: null))).then(
                        (value) {
                      _fetchNotes();
                    });
                //
              },
            ),
          ),
        ]
      ),
    );
  }



  //************METODOS INIT**************
  @override
  void initState() {
    // TODO: implement initState
    _fetchNotes();
    super.initState();

    // notes = servicesNote.getNoteList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //OBTENER TODOS LOS PRODUCTOS WS
  _fetchNotes() async{
    setState(() {
      isLoading = true;
    });

    _apiResponse = await services.getNotesList();

    isLoading = false;


    setState(() {
      isLoading = false;
    });

  }

  //ELIMINAR PRODUCTO DEL LIST
  void dismissCard(Note note) {
    if (_apiResponse.data.contains(note)) {
      setState(() {
        _apiResponse.data.remove(note);
      });
    }
  }

  //ELIMINAR WS
  void deleteNote(String id) async{
    final note = Note(
        id: id,
        title: "",
        content: ""
    );

    final result = await services.deleteNote(note);


    final title = 'Done';
    final text  = result.error ? (result.errorMessage ?? 'An error occurred'): 'Eliminacion correcta.';

    _showDialog(context, title, text);
  }

 //DIALOG
  void _showDialog(BuildContext context, String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Ok"))
          ],
        );
      },
      //presionar si se sale o no del dialog set disabled onPress
      barrierDismissible: true,
    );
  }

  //METHOD ON SELECT
  onSelectedMenuItem(value) {
    print("==========ON VALUE ITEM MENU========== \n${value}");
    switch(value){
      case "food":
        return Navigator.of(context).pushNamed("/food");
      case "reload":
        return _fetchNotes();
      case "socks":
        return Navigator.of(context).pushNamed("/socks");

    }
  }
}




  
