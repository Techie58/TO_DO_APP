
import 'package:hive/hive.dart';

class ToDoDatabase {

  List taskList=[];

  final _mybox=Hive.box('todobox');

  void createInitialDatabase(){
    taskList = [
      ["1st Task", true],
      ["2nd Task", false],
    ];
  }

  //Load the all saved data in Database
  void loadDatabase(){
    taskList=_mybox.get("TASKLIST");
  }

  //Update or Add Data
  void updateDatabase(){
    _mybox.put("TASKLIST", taskList);
  }

}