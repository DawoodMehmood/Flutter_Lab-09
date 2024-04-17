import 'package:flutter/material.dart';
import 'package:task2/models/todo.dart';

import 'widgets/custom_tile.dart';

class TodoListScreen extends StatefulWidget {
  final data;
  const TodoListScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Response'),
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: ListView.builder(
          itemCount: (widget.data as List<Todo>).length,
          itemBuilder: (context, index) {
            List<Todo> todoList = widget.data as List<Todo>;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: CustomTile(todo: todoList[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
