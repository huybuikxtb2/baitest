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
  void sortTodo(TodoModel todo, String title){
    todos.sort((a,b)=>a.title.compareTo(b.title));
  }
  void deteleAll(String  productId) {
    _todos.remove( productId);
    checktotal -= 1;
    notifyListeners();
  }
}
