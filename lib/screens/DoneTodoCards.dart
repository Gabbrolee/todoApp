import 'package:flutter/material.dart';
import 'package:to_do_app/screens/todo_model/model.dart';
import 'package:intl/intl.dart';

class DoneTodoCard extends StatefulWidget {
  // creating variables that the todo card will receive data for
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  Function insertFunction;
  Function deleteFunction;
  DoneTodoCard({
    required this.id,
    required this.isChecked,
    required this.title,
    required this.creationDate,
    required this.insertFunction, // handle changes in the checkbox
    required this.deleteFunction,
    Key? key}) : super(key: key);
  @override
  _DoneTodoCardState createState() => _DoneTodoCardState();
}
class _DoneTodoCardState extends State<DoneTodoCard> {
  @override
  Widget build(BuildContext context) {
    // create local todo
    var anotherTodo = Todo(id: widget.id, title: widget.title, creationDate: widget.creationDate, isChecked: widget.isChecked);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // checkbox
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          ),
          // title and date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(DateFormat('dd-MM-yyyy - hh:mm aaa').format(widget.creationDate)),
              ],
            ),
          ),
          // delete button
        ],
      ),
    );
  }
}
