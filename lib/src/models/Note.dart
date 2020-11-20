import 'package:flutter/foundation.dart';

class Note {
  String id;
  String title;
  String content;
  DateTime createDateTime;
  DateTime lastEditdateTime;

  Note({@required this.id, @required this.title,this.content, this.createDateTime, this.lastEditdateTime});


  factory Note.fromJson(Map<String, dynamic> item){
    return Note(
      id: item['codigo'],
      title: item['producto'],
      content: item['ubicacion'],
      createDateTime: DateTime.now(),
      lastEditdateTime: DateTime.now()
      );
    }


    Map<String, dynamic> toJsonNote(){
      return {
        "id":id,
        "title":title,
        "content":content
      };
    }

}