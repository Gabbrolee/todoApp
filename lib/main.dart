import 'package:flutter/material.dart';
import 'package:to_do_app/screens/task_screen.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyTask(),
    },
  ));

