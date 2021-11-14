import 'package:flutter/material.dart';
import 'package:to_do_app/screens/userinput.dart';
import 'package:to_do_app/screens/todo_model/database_model.dart';
import 'package:to_do_app/screens/todo_model/model.dart';

 class AddToDo extends StatefulWidget {
   const AddToDo({Key? key}) : super(key: key);

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {

  var database = DatabaseConnect();
  void addItem(Todo todo) async {
    await database.insertTodo(todo);
    setState(() {
    });
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('NEW TASK'),
       ),
       body: Column(
         children: [
           UserInput(
             insertFunction: addItem,
           ),
         ],
       ),
     );
   }
}
