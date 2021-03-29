import 'package:flutter/cupertino.dart';
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
      "Hello, you are here to?",
      "Having excess food to donate?"];

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
        appBar: AppBar(
          title: Text("Hunger App"),
          backgroundColor: Colors.lightBlue[900],
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage ("assets/images"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 70.0,right:70.0),
            child: ListView(
              children: <Widget>[
                SizedBox(height:70.0),
                Question(questions[0]),
                ElevatedButton (child: Text("Provide  Food"),
                onPressed: () =>[
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Restaurant())),
                //materialPageRoute use animation transition to a new page
                print("Go to Restaurant Page" ),],
                ),
                SizedBox(height: 10.0),
                ElevatedButton(child: Text("Volunteer"),
                    onPressed: () => [
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Rider())),
                  print("Go to Rider Page" ),],),
                SizedBox(height: 10.0),
                ElevatedButton(child: Text("Support Us!"),
                onPressed: () => [
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Donation())),
                  print("Go to Transaction Page" ),
                ],),
                SizedBox(height: 350.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Powered by ',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'G',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'o',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'o',
                                  style: TextStyle(
                                    color: Colors.yellow[700],
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'g',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'l',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'e ',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(Icons.verified, size: 16,color: Colors.green,)
                                )
                              ]
                          )
                      ),
                    ],
                ),
                SizedBox(height:10.0),
              ])
            ,),
        )
          ,),
      )
    ,);
    //MaterialApp is a CLASS with argument
  }
}

