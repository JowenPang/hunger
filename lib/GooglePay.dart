import 'package:flutter/material.dart';

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
    );
  }
}
