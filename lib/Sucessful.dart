import 'package:flutter/material.dart';

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
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),


      ),
    );
  }
}
