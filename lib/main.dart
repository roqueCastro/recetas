import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recetas/src/app.dart';
import 'package:recetas/src/services/ServiceNote.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => ServiceNote());
}

void main() {
  setupLocator();
  runApp(App());
}
