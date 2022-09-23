import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'chào mày 😋',
      description: '''- có giòn không
- chắc không giòn đâu
- căng quá
- ăn xiên bây giờ''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Cái quần què gì đây',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
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
