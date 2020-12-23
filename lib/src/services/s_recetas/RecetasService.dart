
import 'package:flutter/cupertino.dart';
import 'package:recetas/src/database/Repository.dart';


class RecetasService {


  Repository _repository;

  var nameTable = "recetas";

  RecetasService(){
    _repository = Repository();
  }
  //
  // saveReceta(Receta receta)async{
  //   return await _repository.insertData(nameTable, receta.recetaMap());
  // }
  //
  // readRecetas()async{
  //   return await _repository.readData(nameTable);
  // }
  //
  // readLogueo(user,pass)async{
  //   return await _repository.readDataLogueo(nameTable, user, pass);
  // }
  //
  // readRecetaById(int id) async{
  //   return await _repository.readDataById(nameTable, id);
  // }
  //
  // updateReceta(Receta receta) async{
  //   return await _repository.updateData(nameTable, receta.recetaMap());
  // }

  deleteReceta(int id) async{
    return await _repository.deleteData(nameTable, id);
  }

}