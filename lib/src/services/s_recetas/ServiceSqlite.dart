
import 'package:flutter/cupertino.dart';
import 'package:recetas/src/database/Repository.dart';


class PreparativosService {


  Repository _repository;

  var nameTable = "preparativos";

  PreparativosService(){
    _repository = Repository();
  }

  // save(Receta receta)async{
  //   return await _repository.insertData(nameTable, receta.recetaMap());
  // }

  reads()async{
    return await _repository.readData(nameTable);
  }



  readId(int id) async{
    return await _repository.readDataById(nameTable, id);
  }

  // update(Receta receta) async{
  //   return await _repository.updateData(nameTable, receta.recetaMap());
  // }

  delete(int id) async{
    return await _repository.deleteData(nameTable, id);
  }

}