import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/main.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';
import 'package:todo_app_ui_ii_example/widget/add_todo_dialog_widget.dart';
import 'package:todo_app_ui_ii_example/widget/app_drawer.dart';
import 'package:todo_app_ui_ii_example/widget/completed_list_widget.dart';
import 'package:todo_app_ui_ii_example/widget/todo_list_widget.dart';
enum FilterOptions {
  DeleteAll,
  All,
  FilterPrice
}
class HomePage extends StatefulWidget {

  @override

  static const String routeName = '/hh';
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
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            onSelected: (index) {
              setState(() {
               selectedIndex = index;
              });
            },
            itemBuilder: (context) => <PopupMenuItem>[
              PopupMenuItem(
                child: Text('Trang mới'),
               onTap: (){
                 final provider = Provider.of<TodosProvider>(context, listen: false);

               },


              ),
              PopupMenuItem(
                child: Text('Sắp xếp'),
               value: FilterOptions.All,
              ),
            ],
          ),

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
