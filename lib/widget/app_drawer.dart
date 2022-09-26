import 'package:flutter/material.dart';
import 'package:todo_app_ui_ii_example/main.dart';
import 'package:todo_app_ui_ii_example/page/home_page.dart';
import 'package:todo_app_ui_ii_example/widget/add_todo_dialog_widget.dart';
import 'package:todo_app_ui_ii_example/widget/completed_list_widget.dart';
import 'package:todo_app_ui_ii_example/widget/todo_date.dart';
import 'package:todo_app_ui_ii_example/widget/todo_list_widget.dart';



class AppDrawer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: Column(

        children: [
          AppBar(
            backgroundColor: Colors.green,
            title: Text('Hello Firends!!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Ghi chú'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.date_range_outlined),
            title: Text('ngày tháng'),
         onTap: (){
          Navigator.of(context).pushReplacementNamed(Date.routeName);
         },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Ưa thích'),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}







