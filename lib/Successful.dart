import 'package:flutter/material.dart';

import 'main.dart';

class Successful extends StatefulWidget {
  @override
  _SuccessfulState createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Verify payment'),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:30.0),
              alignment: Alignment.center,
              child: Icon (Icons.check_circle_outline_rounded,color: Colors.green,size:125)
            ),
            Padding(
              padding: EdgeInsets.only(top:25.0),
              child:Text(
                'Transaction Successful ! ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:40.0),
              child:Text(
                'Thank you for your kindness  ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child:Text(
                'Have a nice day !',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),

            SizedBox(height: 50.0),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child:Text(
                'Back to homepage',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: (){
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> MyApp()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
