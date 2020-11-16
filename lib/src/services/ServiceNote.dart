
import 'package:recetas/src/models/Note.dart';

class ServiceNote{


  List<Note> getNoteList(){
    return [
      new Note(
        id: "1",
        title: "Note 1",
        createDateTime: DateTime.now(),
        lastEditdateTime: DateTime.now(),
      ),new Note(
        id: "2",
        title: "Note 2",
        createDateTime: DateTime.now(),
        lastEditdateTime: DateTime.now(),
      ),new Note(
        id: "3",
        title: "Note 3",
        createDateTime: DateTime.now(),
        lastEditdateTime: DateTime.now(),
      ),new Note(
        id: "4",
        title: "Note 4",
        createDateTime: DateTime.now(),
        lastEditdateTime: DateTime.now(),
      ),new Note(
        id: "5",
        title: "Note 5",
        createDateTime: DateTime.now(),
        lastEditdateTime: DateTime.now(),
      ),
    ];
  }
}