import 'package:flutter/material.dart';
import 'package:to_do_app/screens/add_todo.dart';
import 'package:to_do_app/screens/todo_model/navigationDrawer.dart';
import 'package:to_do_app/screens/todo_model/database_model.dart';
import 'package:to_do_app/screens/todo_model/model.dart';
import 'package:to_do_app/screens/todoList.dart';
import 'package:to_do_app/screens/DoneTask.dart';

void main() => runApp(MyTask());


class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
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
    return MaterialApp(
      home: Scaffold(
        drawer: NavigationDrawerWidget(insertFunction: addItem,),
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TODO',
              ),
            ],
          ),
        ),
         body: Column(
           children: [
             TodoList(insertFunction: addItem, deleteFunction:  deleteItem,),
           ],
         ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children:
            [
              SizedBox(width: 40,),
              TextButton(
                onPressed: () async{
                  await  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoneTaskPage()),
                  );
                },
                  child: Image.asset('images/play.png')),
              SizedBox(width: 40,),
              TextButton(

                onPressed: (){},
                  child: Image.asset('images/bag.png')),
              SizedBox(width: 40,),
              TextButton(
                onPressed: () async {
                   await Navigator.push(context, MaterialPageRoute(builder: (context) => AddToDo()),);
                },
                  child: Image.asset('images/plus.png')),
              SizedBox(width: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
