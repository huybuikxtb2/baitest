import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<TodoModel> _todos = [
    TodoModel(
      createdTime: DateTime.now(),
      title: 'Mua đồ ăn ',

    ),
    TodoModel(
      createdTime: DateTime.now(),
      title: 'Đi sinh nhật bạn thân',
        description: 'tặng quà bạn thân',

    ),
    TodoModel(
      createdTime: DateTime.now(),
      title: 'Dắt chó đi dạo 🐕',
      description: '-Dao cong vien'
    ),
    TodoModel(
      createdTime: DateTime.now(),
      title: 'Đi đá bóng với đám bạn 🎉🥳',
    ),
  ];

  List<TodoModel> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<TodoModel> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(TodoModel todo) {
    _todos.add(todo);

    notifyListeners();
  }
  var checktotal = 0;
  void removeTodo(TodoModel todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(TodoModel todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(TodoModel todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
  void sortAlphabet() {
    _todos.sort((a, b) {
      return a.title.compareTo(b.title);
    });
    notifyListeners();
  }
  void deteleAll(TodoModel todo) {
    _todos.remove(todo);
    checktotal -= 1;
    notifyListeners();
  }
  void sortNewest() {
    _todos.sort((a, b) {
      return a.dateTime.millisecondsSinceEpoch
          .compareTo(b.dateTime.millisecondsSinceEpoch);
    });
    _todos = _todos.reversed.toList();
    notifyListeners();
  }
  TodoModel findById(String id) {
    return _todos.firstWhere((prod) => prod?.id == id);
  }
}
