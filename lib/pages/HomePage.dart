import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/utils/DialogBox.dart';
import 'package:to_do/utils/ToDoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller=TextEditingController();



  List taskList = [
    ["1st Task", true],
    ["2nd Task", false],
  ];

  void chekBoxChanged(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }


  void addTaskBtnFun(){
    setState(() {
      if(_controller.text.isNotEmpty){
      taskList.add([_controller.text,false]);
      Navigator.of(context).pop;
      _controller.clear();
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
            task: taskList[index][0],
            taskCompleted: taskList[index][1],
            onChanged: (value) => chekBoxChanged(value, index),
          );
        },
        itemCount: taskList.length,
      ),
    );
  }
}
