import 'package:flutter/material.dart';
import 'package:lambor/add_todo_dialog_widget.dart';
import 'package:lambor/completed_list_widget.dart';
import 'package:lambor/todo_list_widget.dart';

class HomePage extends StatefulWidget {
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
      backgroundColor: Colors.white,
   //   appBar: AppBar(
     //   title: Text("Welcome"),
     // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   unselectedItemColor: Colors.white.withOpacity(0.7),
      //   selectedItemColor: Colors.white,
      //   currentIndex: selectedIndex,
      //   onTap: (index) => setState(() {
      //     selectedIndex = index;
      //   }),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.fact_check_outlined),
      //       label: 'Todos',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.done, size: 28),
      //       label: 'Completed',
      //     ),
      //   ],
      // ),
      body:
      Stack(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Container(
            height: 292,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1552845108-5f775a2ccb9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80'
                  ),
                )
              ),

          ),
          ),



          Padding(
            padding: EdgeInsets.only(top: 266),
             child:
              LinearProgressIndicator(
                minHeight: 6,
                value: 0.55,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                backgroundColor: Colors.white,
              )
            ),


          Padding(
              padding: EdgeInsets.only(top: 227,left: 262),
              child:
              SizedBox(
                height: 22,
           width: 22,
           child: CircularProgressIndicator(
             value: 0.65,
             valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
             backgroundColor: Colors.white,
           ),
              )




          ),
          Padding(
            padding: EdgeInsets.only(top: 230,left: 290),
            child: Container(
              height: 32,
              color: Colors.transparent,
              child: Container(
                child: Text("65% done",style: TextStyle(color: Colors.white),),
              ),
            ),
          ),





          Padding(
            padding: EdgeInsets.only(top: 48,right: 310),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.menu,color: Colors.white,),
              ],

            ),
          ),


          Padding(
            padding: EdgeInsets.only(top: 98,left: 30),
            child: Container(
              height: 72,
              color: Colors.transparent,
              child: Container(
                child: Text("Your\n"+"Things",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 32),),
              ),
            ),
          ),




          Padding(
            padding: EdgeInsets.only(top: 243,left: 30),
            child: Container(
              height: 32,
              color: Colors.transparent,
              child: Container(
                child: Text("SEP 5,2015",style: TextStyle(color: Colors.white),),
              ),
            ),
          ),




          Padding(
            padding: EdgeInsets.only(top: 148,left: 250),
            child: Container(
              height: 32,
              color: Colors.transparent,
              child: Container(
                child: Text("24",style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 148,left: 320),
            child: Container(
              height: 32,
              color: Colors.transparent,
              child: Container(
                child: Text("15",style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 163,left: 210),
            child: Container(
              height: 22,
              color: Colors.transparent,
              child: Container(
                child: Text("Personal",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 163,left: 280),
            child: Container(
              height: 22,
              width: 161,
              color: Colors.transparent,
              child: Container(
                child: Text("Business",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
              ),
            ),
          ),



    // Container(
    // decoration: BoxDecoration(
    // image: DecorationImage(
    // image: NetworkImage('https://www.exampledomain.com/images/background.jpg'),
    // fit: BoxFit.fill,
    // ),
    // ),
    //
    //

          Padding(
            padding: EdgeInsets.only(top: 310,left: 32),
            child: Container(
              height: 32,
              color: Colors.transparent,
              child: Text("INBOX",style: TextStyle(fontWeight: FontWeight.normal),),
            ),
          ),


          Padding(
            padding: EdgeInsets.only(top: 720,left: 22),
            child: TextButton(
            style: ElevatedButton.styleFrom(

              primary:  Colors.white

            ),
              //  height: 32,
            //  color: Colors.transparent,
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedListWidget())
                  );
              },
              child: Text("COMPLETED",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 727,left: 115),
            child: Container(
              height: 35,
              color: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 10,
                child: Text("5",style: TextStyle(color: Colors.white),),

              ),
            ),
          ),


          Padding(
            padding: EdgeInsets.only(top: 310),
            child: Container(
              height: 455,
             // color: Colors.blue,
              child: tabs[selectedIndex],
            ),
          ),


          //         tabs[selectedIndex],
        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.lightBlueAccent.shade400,
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
