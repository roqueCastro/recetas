import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recetas/src/models/ApiResponse.dart';
import 'package:recetas/src/models/Note.dart';
import 'package:http/http.dart' as http;
class ServicesApiNote{

  static const api = "https://pruebadisenoroque.000webhostapp.com/ws";


  //METODO OBTENER LIST PRODUCTO POR MEDIO POST WS
  Future<ApiResponse<List<Note>>>  getNotesList() async{

      http.Response response = await http.post(api + "/flutter.php",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Operacion": "flutter"
        }));

      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);
        if(jsonData['error']){
          return ApiResponse<List<Note>>(error: jsonData['error'], errorMessage: jsonData['errorMessage']);
        }

        final data = json.decode(jsonData['data']);
        final notes = <Note>[];
        for(var item in data){
          notes.add(Note.fromJson(item));
        }
        return ApiResponse<List<Note>>(data: notes);
      } else {
        return ApiResponse<List<Note>>(error: true, errorMessage: "Ocurred on Error");
      }
  }

  //METODO OBTENER PRODUCTO POR MEDIO POST WS
  Future<ApiResponse<Note>>  getNote(String NoteID) async{

    http.Response response = await http.post(api + "/flutter.php",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Operacion": "usuario-id",
          "NoteID": NoteID
        }));

    if (response.statusCode == 200) {

      final jsonData = json.decode(response.body);
      if(jsonData['error']){
        return ApiResponse<Note>(error: jsonData['error'], errorMessage: jsonData['errorMessage']);
      }
      //
      final item = json.decode(jsonData['data']);

      return ApiResponse<Note>(data: Note.fromJson(item[0]));
      //
    } else {
      return ApiResponse<Note>(error: true, errorMessage: "Ocurred on Error");
    }
    //.
  }


  //METODO CREAR PRODUCTO WS
  Future<ApiResponse<bool>>  createNote(Note noteadd) async{
    http.Response response = await http.post(api + "/flutter.php",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Operacion": "usuario-add",
          "data": json.encode(noteadd.toJsonNote())
        }));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      //
      return ApiResponse<bool>(data:jsonData['data'], error: jsonData['error'], errorMessage: jsonData['errorMessage']);
      //
    } else {
      return ApiResponse<bool>(error: true, errorMessage: "Ocurred on Error");
    }
    //.
  }

  //METODO ACTUALIZAR PRODUCTO WS
  Future<ApiResponse<bool>>  updateNote(Note noteadd) async{
    http.Response response = await http.post(api + "/flutter.php",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Operacion": "usuario-upd",
          "data": json.encode(noteadd.toJsonNote())
        }));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      //
      return ApiResponse<bool>(data:jsonData['data'], error: jsonData['error'], errorMessage: jsonData['errorMessage']);
      //
    } else {
      return ApiResponse<bool>(error: true, errorMessage: "Ocurred on Error");
    }
    //.
  }

  //METODO ELIMINAR PRODUCTO WS
  Future<ApiResponse<bool>>  deleteNote(Note noteadd) async{
    http.Response response = await http.post(api + "/flutter.php",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Operacion": "usuario-del",
          "data": json.encode(noteadd.toJsonNote())
        }));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      //
      return ApiResponse<bool>(data:jsonData['data'], error: jsonData['error'], errorMessage: jsonData['errorMessage']);
      //
    } else {
      return ApiResponse<bool>(error: true, errorMessage: "Ocurred on Error");
    }
    //.
  }
  
}
