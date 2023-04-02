import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
  //static const dateTime = 'dateTime';
}

class Todo {
  DateTime createdTime;

 // DateTime dateTime;
  String title;
  String id;
  String description;

  bool isDone;
  String type;
  String place;


  Todo({
    required this.type,
    required this.place,
    required this.createdTime,
  //  required this.dateTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });
}
