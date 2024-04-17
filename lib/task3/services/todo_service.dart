import 'dart:convert';

import 'package:task2/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  static Future<List<Todo>> fetchTodo() async {
    String stringUrl = 'https://jsonplaceholder.typicode.com/todos';
    final response = await http.get(Uri.parse(stringUrl));
    List<Todo> todoList = [];
    if (response.statusCode == 200) {
      String body = response.body;
      final jsonResponse = jsonDecode(body) as List;
      jsonResponse.forEach((element) {
        todoList.add(Todo.fromJson(element));
      });
    }
    await Future.delayed(Duration(seconds: 5));
    return todoList;
  }
}
