import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:todo_app_ui_ii_example/model/todo.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';





class ChiTiet extends StatefulWidget {
  static const routeName = '/chitiet';
  const ChiTiet({Key key}) : super(key: key);

  @override
  State<ChiTiet> createState() => _ChiTietState();
}


class _ChiTietState extends State<ChiTiet> {
  String get productId => ModalRoute.of(context)?.settings.arguments as String;
  TodoModel get loadedProduct =>
      context.read<TodosProvider>().findById(productId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${loadedProduct.title}'),
      ),
      body: Text('${loadedProduct?.description}',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}