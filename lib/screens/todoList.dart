import 'package:flutter/material.dart';
import 'package:to_do_app/screens/todoCards.dart';
import 'package:to_do_app/screens/todoList.dart';
import 'package:to_do_app/screens/todo_model/database_model.dart';

class TodoList extends StatelessWidget {
  // create an object of database connect
  var database = DatabaseConnect();
  final Function insertFunction;
  final Function deleteFunction;
   TodoList({
  required this.insertFunction,
  required  this.deleteFunction,
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
          future: database.getTodo(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            var data = snapshot.data; // shows list of todo
            var datalength = data!.length;
            return datalength == 0 ?
            Center(child: Text('Add a Todo'),
            ) :
            ListView.builder(
              itemCount: datalength,
                itemBuilder: (context, i) => TodoCard(
                    id: data[i].id,
                    isChecked:data[i].isChecked ,
                    title:data[i].title,
                    creationDate: data[i].creationDate,
                    insertFunction:insertFunction,
                    deleteFunction:deleteFunction,
                ),
            );
          },
        ),
    );
  }
}
