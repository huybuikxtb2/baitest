import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'chào mày 😋',

    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Cái quần què gì đây',

    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Dắt chó đi dạo 🐕',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'cho tao làm quen nhá 🎉🥳',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
