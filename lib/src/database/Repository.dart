
import 'package:flutter/cupertino.dart';
import 'package:recetas/src/database/DatabaseConnection.dart';
import 'package:sqflite/sqflite.dart';




class Repository {
  DatabaseConnection _databaseConnection;

  Repository(){
    //init database
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get  database async{
    if(_database!=null) return _database;
    // _database = await _databaseConnection.setDatabase();

    return _database;
  }

  //INSERT
  insertData(table, data) async{
    var connection = await database;

    return await connection.insert(table, data);
  }

  //READ
  readData(table) async{
    var connetion = await database;
    return await connetion.query(table);
  }

  readDataById(tabla, id) async{
    var connection = await database;
    return await connection.query(tabla, where: 'id=?', whereArgs: [id]);
  }

  updateData(table, data)async{
    var connection =  await database;
    return connection.update(table, data, where: "id=?", whereArgs: [data['id']]);
  }

  deleteData(table, id) async{
    var connection =  await database;
    return connection.delete(table, where: 'id=?', whereArgs: [id]);
  }

  readDataByColumn(tabla, column, argument) async{
    var connection = await database;
    return await connection.query(tabla, where: '$column=?', whereArgs: [argument]);
  }
}