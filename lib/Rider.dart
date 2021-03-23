import 'package:flutter/material.dart';
import 'package:flutter_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Orderlist.dart';

class Rider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().newOrder,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Rider page"),
          backgroundColor: Colors.black,

        ),
        body: Orderlist(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[BottomNavigationBarItem(icon:
          Icon(Icons.home_rounded),
              backgroundColor: Colors.white,
              label: 'Home'
          ),
            BottomNavigationBarItem(icon:
            Icon(Icons.search),
                label: 'Search'
            ),
            BottomNavigationBarItem(icon:
            Icon(Icons.more_horiz_outlined),
                label: 'Menu'
            )],
          selectedItemColor:Colors.red,
        ),
      ),
    );
  }
}
