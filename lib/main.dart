import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/page/home_page.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';
import 'package:todo_app_ui_ii_example/widget/Calculator.dart';
import 'package:todo_app_ui_ii_example/widget/completed_list_widget.dart';
import 'package:todo_app_ui_ii_example/widget/detail_todo.dart';
import 'package:todo_app_ui_ii_example/widget/search.dart';
import 'package:todo_app_ui_ii_example/widget/todo_date.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: HomePage(),
routes: {

  HomePage.routeName : (context) => HomePage(),
  Date.routeName : (context)=> Date(),
MyHomePage.routeName : (context)=> MyHomePage(),
  CompletedListWidget.routeName: (context) => CompletedListWidget(),
  ChiTiet.routeName : (context)=> ChiTiet(),
  Search.routeName: (context)=> Search()

},
        ),
      );
}
