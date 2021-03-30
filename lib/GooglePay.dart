import 'package:flutter/material.dart';

import 'Successful.dart';

class GooglePay extends StatefulWidget {
  @override
  _GooglePayState createState() => _GooglePayState();
}

class _GooglePayState extends State<GooglePay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Pay'),
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
              'Redirecting you to Google Pay services..',
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
