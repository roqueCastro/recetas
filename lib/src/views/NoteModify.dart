import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recetas/src/models/ApiResponse.dart';
import 'package:recetas/src/models/Note.dart';
import 'package:recetas/src/services/ServicesApiNote.dart';

class NoteModify extends StatefulWidget {
  String idNote;
  NoteModify({Key key, this.idNote}): super (key: key);

  @override
  _NoteModify createState() => _NoteModify();
}

class _NoteModify extends State<NoteModify>{

  ServicesApiNote get service => GetIt.I<ServicesApiNote>();


  bool get isEditing => widget.idNote == null;
  bool isLoading = true;
  bool btnEnable = true;

  Note note;

  final _keyForm = GlobalKey<FormState>();

  TextEditingController _titleControler = TextEditingController();
  TextEditingController _contentControler = TextEditingController();

  FocusNode _titleFocus;
  FocusNode _contentFocus;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Create note": "Edit note"),
      ),
      body: Builder(
        builder: (_){
          //..
          if(isLoading){
            return Form(
              key: _keyForm,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                child: SingleChildScrollView(

                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Title",
                          hintText: "Example: Nota 1",
                        ),
                        controller: _titleControler,
                        focusNode: this._titleFocus,
                        validator: (validator){return validator.isEmpty?"Este campo es obligatorio.":null;},
                        onEditingComplete: () => validRequestFocus(context),
                        textInputAction: TextInputAction.next,

                      ),
                      SizedBox(height: 25,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Content",
                          hintText: "Example: Empresa......",
                        ),
                        controller: _contentControler,
                        focusNode: this._contentFocus,
                        validator: (validator){return validator.isEmpty?"Este campo es obligatorio.":null;},


                      ),
                      SizedBox(height: 10,),
                      bottonEnviar(),
                    ],
                  ),
                ),
              ),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }

          //..........
        },
      ),
    );
  }

  //METODOS
  @override
  void initState() {
    // TODO: implement initState
    _titleFocus = FocusNode();
    _contentFocus = FocusNode();
    //
    _fechNote();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _titleFocus.dispose();
    _contentFocus.dispose();
  }

  void _fechNote() {
    if(!isEditing){
      setState(() {
        isLoading = false;
      });

       service.getNote(widget.idNote).then((value) {

        setState(() {
          isLoading = true;
        });

        note = value.data;

        _titleControler.text = note.title;
        _contentControler.text = note.content;
      });


    }
  }

  //METODO CREAR NOTA Y ENVIAR WS
  void createNote(BuildContext context) async{
    if(_keyForm!=null && _keyForm.currentState.validate()){
      //continuit
      final note = Note(
        id: "000",
        title: _titleControler.text,
        content: _contentControler.text
      );

      //
      setState(() {
        btnEnable = false;
      });

      final result = await service.createNote(note);


      final title = 'Done';
      final text  = result.error ? (result.errorMessage ?? 'An error occurred'): 'Nota creada.';

      if(!result.error){
        _titleControler.text = "";
        _contentControler.text = "";
      }

      setState(() {
        btnEnable = true;
      });
      _showDialog(context, title, text);
    }else{
      validRequestFocus(context);
    }
  }

  //METODO ACTUALIZAR NOTA Y ENVIAR WS
  void updateNote(BuildContext context) async{
    if(_keyForm!=null && _keyForm.currentState.validate()){
      //continuit
      final note = Note(
          id: widget.idNote,
          title: _titleControler.text,
          content: _contentControler.text
      );

      //
      setState(() {
        btnEnable = false;
      });

      final result = await service.updateNote(note);


      final title = 'Done';
      final text  = result.error ? (result.errorMessage ?? 'An error occurred'): 'Actualizacion correcta.';

      setState(() {
        btnEnable = true;
      });
      _showDialog(context, title, text);
    }else{
      validRequestFocus(context);
    }
  }

  void validRequestFocus(BuildContext context){
    FocusNode focus;
    if(this._titleControler == null || this._titleControler.value.text == ""){
      focus = _titleFocus;
    }else if(this._contentControler == null || this._contentControler.value.text == ""){
      focus  = _contentFocus;
    }
    if(focus != null){
      FocusScope.of(context).requestFocus(focus);
    }
  }

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

  //BOTON ENVIAR
   Widget bottonEnviar() {
    if(btnEnable){
      return RaisedButton(
        elevation: 2,
        child: Text("Registrar"),
        color: (btnEnable) ? Theme.of(context).primaryColor : Colors.black12,

        onPressed: (){
          if(isEditing){
            //create note
            if(btnEnable){createNote(context);}
          }else{
            //edit note
            if(btnEnable){updateNote(context);}
          }
          //..
        },
      );
    }else{
      return CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }

  }




}