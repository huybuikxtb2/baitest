import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';
import 'package:todo_app_ui_ii_example/page/edit_todo_page.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';
import 'package:todo_app_ui_ii_example/utils.dart';
import 'package:todo_app_ui_ii_example/widget/detail_todo.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(

          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editTodo(context, todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: ()  {
                _showDialog(context, todo);
              },
              icon: Icons.delete,
            )
          ],


          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ChiTiet.routeName,arguments: todo.id);
        },
        child: Container(
          color: Colors.greenAccent,
          padding: EdgeInsets.all(20),

          child: Row(
            children: [
              Radio(
                activeColor: Theme.of(context).primaryColor,

                value: todo.isDone,
                onChanged: (_) {

                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontSize: 22,
                      ),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
            ],

          ),
        ),
      );

  void deleteTodo(BuildContext context, TodoModel todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, TodoModel todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
void _showDialog(BuildContext context,  TodoModel todo) {
  // user defined function void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context, builder: (BuildContext context) {
    // return object of type Dialog
    return AlertDialog(
      title: Text("Delete"),
      content: Text("Bạn có chắc chắn muốn xóa?"),
      actions: <Widget>[
        new FlatButton(
          child: new Text("không"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        new FlatButton(
          child: new Text("Có"),
          onPressed: () {
            final provider = Provider.of<TodosProvider>(context, listen: false);
            provider.removeTodo(todo);
            Navigator.pop(context);
          }
        ),
      ],
    );
  },
  );
}
