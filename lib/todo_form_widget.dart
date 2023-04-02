import 'package:flutter/material.dart';


class TodoFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
 // final DateTime datetime;// = DateTime.now();

  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
   // required this.datetime,
  }) : super(key: key);

  @override
  State<TodoFormWidget> createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
 // get datetime => DateTime.now();

  DateTime dateTime = DateTime.now();

  String _selectedRepeat = "Business";

  List<String> repeatList=[
    "Commercial","Non-Commercial","Business"
  ];

  String _selectedPlace = "Raipur";

  List<String> placeList=[
    "Raipur","Nagpur","Mumbai"
  ];



  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            bun(),
            SizedBox(height: 8,),
            place(),
            SizedBox(height: 8,),
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 16),
            dateButton(),
            SizedBox(height: 8,),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: widget.title,
        onChanged: widget.onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: widget.description,
        onChanged: widget.onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Notification',
        ),
      );

  // Widget buildButton() => SizedBox(
  //       width: double.infinity,
  //       child: ElevatedButton(
  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(Colors.blue),
  //         ),
  //         onPressed: widget.onSavedTodo,
  //         child: Text('ADD YOUR THING'),
  //       ),
  //     );



  Widget buildButton() =>   Padding(
        padding: EdgeInsets.all(1),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: widget.onSavedTodo,
          child: Text('ADD YOUR THING'),
        ),
      );




  Widget dateButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: _showDatePicker,
      child: Text("Time "+dateTime.day.toString()+"/"+dateTime.month.toString()+"/"+dateTime.year.toString(),style: TextStyle(color: Colors.blue),),

    ),
  );


  Widget place() =>
         Stack(
          children: <Widget>[

            DropdownButton(
              icon: Icon(Icons.keyboard_arrow_up),
              underline: Container(height: 1,),
              onChanged: (String? newValue){
                setState(() {
                  _selectedPlace = newValue!;
                });
              },
              items: placeList.map<DropdownMenuItem<String>>((String? value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value!,style: TextStyle(color: Colors.red),),
                );
              }
              ).toList(),

            ),

            SizedBox(height: 12,),
            Text('$_selectedPlace'),

          ],
        );





  Widget bun() =>
      Stack(
      children: <Widget>[
     DropdownButton(
      icon: Icon(Icons.keyboard_arrow_up),
      underline: Container(height: 1,),
      onChanged: (String? newValue){
        setState(() {
          _selectedRepeat = newValue!;
        });
      },
      items: repeatList.map<DropdownMenuItem<String>>((String? value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value!,style: TextStyle(color: Colors.red),),
        );
      }
      ).toList(),

    ),

        SizedBox(height: 12,),
        Text('$_selectedRepeat'),

  ],
  );


  void _showDatePicker(){
    showDatePicker(
      context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2015),
        lastDate: (new DateTime.now()).add(new Duration(days: 7))//Cannot be 2020
    ).then((value) {
      setState((){
         dateTime = value!;
      });
    });
  }


}





