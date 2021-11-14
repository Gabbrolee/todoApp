import 'package:flutter/material.dart';
import 'package:to_do_app/screens/todo_model/database_model.dart';
import 'package:to_do_app/screens/todo_model/model.dart';
class NavigationDrawerWidget extends StatefulWidget {

  NavigationDrawerWidget({required this.insertFunction,
    Key? key}) : super(key: key);
  final Function insertFunction ;
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  var database = DatabaseConnect();
  void addItem(Todo todo) async {
    await database.insertTodo(todo);
    setState(() {
    });
  }
  var textController = TextEditingController();
  var textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding:  const EdgeInsets.symmetric(horizontal: 5, vertical: 100),
        child: Column(
          children: <Widget> [
            Row(
              children: [
                Text('Name'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: Container(
                  padding:  const EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'Add a todo'
                    ),

                  ),)),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                Text('Description'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: Container(
                  padding:  const EdgeInsets.symmetric(horizontal:10),
                  child: TextFormField(
                    controller: textFieldController,
                    maxLines: 5,
                    decoration: InputDecoration(fillColor: Colors.white,
                        hintText: 'Enter your description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))
                        )
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(height: 150,),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.all(10),
                  height: 60.0,
                  width: 150.0,
                  child: TextButton(
                    onPressed: (){
                      var myTodo;
                      Navigator.pop(context,{
                        myTodo = Todo(
                            title: textController.text,
                            creationDate: DateTime.now(),
                            isChecked: false
                        ),
                      });
                      //passing myTodo as a parameter in the insertFunction
                      widget.insertFunction(myTodo);
                    },
                    child: Text("Add",
                        style: TextStyle(fontSize: 15, color: Colors.white,
                          backgroundColor: Colors.blue,
                        )),

                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
