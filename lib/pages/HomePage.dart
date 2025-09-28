import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/dbHealper/Database.dart';
import 'package:to_do/utils/DialogBox.dart';
import 'package:to_do/utils/ToDoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final _controller=TextEditingController();

  final _mybox=Hive.box('todobox');
  ToDoDatabase db=new ToDoDatabase();

  @override
  void initState() {

    //If app is opening 1st time then sample data added thorugh intidb fun
    if(_mybox.get("TASKLIST") == null){
      db.createInitialDatabase();
    }else{
      db.loadDatabase();
    }

    super.initState();
  }




  void chekBoxChanged(bool? value, int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
      db.updateDatabase();
    });
  }


  void addTaskBtnFun(){
    setState(() {
      if(_controller.text.isNotEmpty){
        db.taskList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();
      db.updateDatabase();


      }

    });

  }


  void createNewTask() {
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        addTaskBtnFun: addTaskBtnFun,
        closeDialogBtnFun: () => Navigator.of(context).pop() ,
      );
    });
  }

  void deleteTaskBtnFun(int index){
    setState(() {
      db.taskList.removeAt(index);
      db.updateDatabase();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text("To DO")),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
            task: db.taskList[index][0],
            taskCompleted: db.taskList[index][1],
            onChanged: (value) => chekBoxChanged(value, index),
            deleteTaskBtn: (context) => deleteTaskBtnFun(index),
          );
        },
        itemCount: db.taskList.length,
      ),
    );
  }
}
