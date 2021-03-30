import 'package:flutter/material.dart';

import 'Successful.dart';

class FPX extends StatefulWidget {
  @override
  _FPXState createState() => _FPXState();
}

class _FPXState extends State<FPX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FPX Payment'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Redirecting you to Online Banking Platform..',
              style: TextStyle(
                fontSize: 18
              ),
            ),
            SizedBox(height:100),
            new CircularProgressIndicator(),
            SizedBox(height:100),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Successful()));
                } ,
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
