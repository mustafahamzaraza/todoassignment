import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lambor/todo.dart';
import 'package:lambor/todos.dart';
import 'package:lambor/utils.dart';
import 'package:provider/provider.dart';


import 'edit_todo_page.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
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
          onTap: () => editTodo(context,todo),
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          onTap: () => deleteTodo(context,todo),
          icon: Icons.delete,
        )
      ],
      child: buildTodo(context),
    ),
  );

  Widget buildTodo(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        // Checkbox(
        //   activeColor: Theme.of(context).primaryColor,
        //   checkColor: Colors.white,
        //   value: todo.isDone,
        //   onChanged: (_) {
        //
        //     final provider  = Provider.of<TodosProvider>(context,listen: false);
        //     final isDone = provider.toggleTodoStatus(todo);
        //     Utils.showSnackBar(context, isDone ? 'Task Completed' : 'Task Incompleted',);
        //   },
        // ),
       // const SizedBox(width: 20),
        Expanded(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[

                     CircleAvatar(
                       radius: 16.0,
                       backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                       backgroundColor: Colors.grey.shade300,
                     ),

                     Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(right: 112),
                           child: Text(todo.title,style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,),

                         ),
                         Padding(
                           padding: const EdgeInsets.only(right: 122),
                           child:
                           Text(
                             todo.place,
                             style: TextStyle(fontWeight: FontWeight.w300,),
                             maxLines: 1,
                           ),
                         ),
                       ],
                     ),

                     Padding(
                       padding: const EdgeInsets.fromLTRB(22, 22, 2, 9)
                       ,
                       child: Text(
                         //  todo.createdTime.day.toString()
                        // todo.createdTime.toString()+
                             "9am"
                         ,style: TextStyle(fontWeight: FontWeight.w300),
                       ),
                     ),
                   ],
                 ),


             Divider(
               height: 25,
               color: Colors.grey,
               thickness: .8,
               indent: 8,
               endIndent: 8,
             )



//                             Text(
//                 todo.title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).primaryColor,
//                   fontSize: 22,
//                 ),
//               ),
//               if (todo.description.isNotEmpty)
//                 Container(
//                   margin: EdgeInsets.only(top: 4),
//                   child: Text(
//                     todo.description,
//                     style: TextStyle(fontSize: 20, height: 1.5),
//                   ),
//                 ),
//
//
// Padding(
//     padding: EdgeInsets.all(12),
// child:
// Text(
//   // todo.createdTime.toString(),
//   "Date: "+todo.createdTime.day.toString()+"/"+todo.createdTime.month.toString()+"/"+todo.createdTime.year.toString(),
//   style: TextStyle(
//     fontWeight: FontWeight.normal,
//     color: Colors.cyan,
//     fontSize: 17,
//   ),
// ),
// ),
//
//


            ],
          ),
        ),
      ],
    ),
  );






  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context,listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context,"Deleted");

  }





  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTodoPage(todo: todo),
    ),
  );

}
