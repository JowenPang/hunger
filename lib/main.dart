import 'package:flutter/material.dart';
import 'package:flutter_app/Restaurant.dart';
import './question.dart';
import './Restaurant.dart';
import 'Rider.dart';
import 'Donation.dart';
void main(){
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
  //myApp is actually parent of material App so , context is actually parent of material app
  //therefore we cannot use navigator , so we now wrap MyApp inside MaterialApp
}

class MyApp extends StatelessWidget {
 /* @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }      // rebuild when internal data change

}
class MyAppState extends State<MyApp>{
  // persistent
  var _counter=0; //internal data (can only handle by Stateless widget

  void _questionCounter(){
    setState(() {
      //update the widget by calling build method again, only update data that has been change
      _counter=_counter+1;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    var questions=[
      "You are here to ?? :V lolllllll",
      "Having excess food to donate?"];

    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Hunger App"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 70.0,right:70.0),
        child: ListView(
          children: <Widget>[
            Question(questions[0]),
            ElevatedButton (child: Text("Provide  Food"),
            onPressed: () =>[
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Restaurant())),
            //materialPageRoute use aimation transition to a new page
            print("Go to Restaurant Page" ),],
            ),
            ElevatedButton(child: Text("Volunteer"),
                onPressed: () => [
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Rider())),
              print("Go to Rider Page" ),],),
            ElevatedButton(child: Text("Support Us!"),
            onPressed: () => [
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Donation())),
              print("Go to Transaction Page" ),
            ],),
          ])
        ,)
        ,)
    ,);
    //MaterialApp is a CLASS with argument
  }

}

