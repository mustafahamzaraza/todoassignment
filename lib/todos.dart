import 'package:flutter/cupertino.dart';
import 'package:lambor/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      type: '',
      place: 'Raipur,CG',
      createdTime: DateTime.now(),
      //dateTime: DateTime.now(),
      title: 'Buy Food.. ',
      description: '''- Eggs
- Milk
- Bread
- Water''', id: '',
    ),
    Todo(
      type: '',
      place: 'Nagpur,MH',
      createdTime: DateTime.now(),
    //  dateTime: DateTime.now(),
      title: 'trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''', id: '',
    ),
    Todo(
      type: '',
      place: 'Nagpur,MH',
      createdTime: DateTime.now(),
     // dateTime: DateTime.now(),

      title: 'Walk the Dog', id: '',
    ),
    Todo(
      type: '',
      place: 'Mumbai,MH',
      createdTime: DateTime.now(),
     // dateTime: DateTime.now(),
      title: 'birthday party', id: '',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();


  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }


  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
