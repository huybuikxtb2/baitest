import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';
import 'package:todo_app_ui_ii_example/page/edit_todo_page.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';
import 'package:todo_app_ui_ii_example/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

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
        onTap: () => editTodo(context, todo),
        child: Container(
          color: Colors.greenAccent,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Radio(
                activeColor: Theme.of(context).primaryColor,

                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);

                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task completed' : 'Task marked incomplete',
                  );
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

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
void _showDialog(BuildContext context,  Todo todo) {
  // user defined function void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context, builder: (BuildContext context) {
    // return object of type Dialog
    return AlertDialog(
      title: Text("Delete"),
      content: Text("Are you sure you want to delete?"),
      actions: <Widget>[
        new FlatButton(
          child: new Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        new FlatButton(
          child: new Text("Yes"),
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
