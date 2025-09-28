import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback addTaskBtnFun;
  VoidCallback closeDialogBtnFun;


  DialogBox({
    required this.controller,
    required this.addTaskBtnFun,
    required this.closeDialogBtnFun,

  });




  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add Task", style: TextStyle(fontWeight: FontWeight.bold)),
            InkWell(
                onTap: closeDialogBtnFun,
                child: Icon(Icons.close)),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                focusColor: Colors.red,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                ),
                hintText: "Add a Task",
              ),
            ),
            ElevatedButton(
              onPressed: addTaskBtnFun,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[200]
              ),
              child: Text(
                '     Add     ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      actions: [],
    );
  }
}
