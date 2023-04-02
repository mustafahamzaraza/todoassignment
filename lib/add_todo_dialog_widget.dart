import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lambor/todo.dart';
import 'package:lambor/todos.dart';
import 'package:lambor/todo_form_widget.dart';
import 'dart:math';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String type = '';
  String place = '';
  @override
  Widget build(BuildContext context) =>
  //    AlertDialog
    //    (
      //  content:
  Scaffold(
    backgroundColor: Colors.white,
    body: new  Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Icon(
                  Icons.arrow_back,
                color: Colors.blue,
                size: 22,
              ),


              Text(
                'Add new thing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue
                ),
              ),



              Icon(
                  Icons.notes,
                color: Colors.blue,
                size: 22,
              ),



            ],
          ),

          const SizedBox(height: 8),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSavedTodo: addTodo,

            // datetime: DateTime.now(),
          ),
        ],
      ),
    ),
  );




     // );



  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        type: type,
        place: place,
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
     // dateTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
