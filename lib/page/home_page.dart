import 'package:flutter/material.dart';
import 'package:todo_app_ui_ii_example/main.dart';
import 'package:todo_app_ui_ii_example/widget/add_todo_dialog_widget.dart';
import 'package:todo_app_ui_ii_example/widget/app_drawer.dart';
import 'package:todo_app_ui_ii_example/widget/completed_list_widget.dart';
import 'package:todo_app_ui_ii_example/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(MyApp.title),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.dashboard)),

        ],
      ),

      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blueAccent,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
