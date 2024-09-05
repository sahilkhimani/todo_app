import 'package:flutter/material.dart';
import 'package:todo_app/tasks_todo.dart';

void main() {
  runApp(const TodoClass());
}

class TodoClass extends StatelessWidget {
  const TodoClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasksTodo(),
    );
  }
}
