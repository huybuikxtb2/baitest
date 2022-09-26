import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class TodoModel {

  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;
  final DateTime dateTime;
  final String productId;
  TodoModel({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
    this.dateTime,
    this.productId,
  });


}
