import 'package:flutter/material.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Orderlist.dart';
import 'package:flutter_app/Order.dart';


class Rider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().newOrder,
      initialData: null,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Rider page"),
            backgroundColor: Colors.green,
            actions: <Widget>[
              ElevatedButton(
                child: Text("Clear all"),
                  onPressed: () {
                    // DatabaseService().clearAllData();
                  }),
            ],
          ),

          body: Orderlist(), //where we show list of order

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
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
            selectedItemColor:Colors.grey,
          ),
        ),
      ),
    );
  }
}
