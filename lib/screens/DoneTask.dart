import 'package:flutter/material.dart';
import 'package:to_do_app/screens/DoneTodoList.dart';
import 'package:to_do_app/screens/task_screen.dart';
import 'package:to_do_app/screens/todo_model/database_model.dart';
import 'package:to_do_app/screens/todo_model/model.dart';

class DoneTaskPage extends StatefulWidget {

  const DoneTaskPage({Key? key}) : super(key: key);

  @override
  _DoneTaskPageState createState() => _DoneTaskPageState();
}

class _DoneTaskPageState extends State<DoneTaskPage> {
  // creating communication between the two widget
  var textController = TextEditingController();
  // creating a  database object so we can access the database functions
  var database = DatabaseConnect();

  void addItem(Todo todo) async {
    await database.insertTodo(todo);
    setState(() {
    });
  }
  // function to delete a todo
  void deleteItem(Todo todo) async {
    await database.deleteTodo(todo);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        centerTitle: true,
        title: Text('DONE TASK',
          style: TextStyle(
              color:  Colors.black
          ),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: [
          DoneTodoList(insertFunction: addItem, deleteFunction:  deleteItem,),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
