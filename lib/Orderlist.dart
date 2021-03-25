import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Order.dart';

import 'OrderCard.dart';

class Orderlist extends StatefulWidget {
  @override
  _OrderlistState createState() => _OrderlistState();
}

class _OrderlistState extends State<Orderlist> {
  @override
  Widget build(BuildContext context) {

    //final foodlist=Provider.of<QuerySnapshot>(context); QuerySnapshot just show a report of all data
    final foodlist=Provider.of<List<Order>>(context);

    foodlist.forEach((element) {
      print(element.description);
      print(element.pax);
    });

    return ListView.builder(
      itemCount: foodlist.length,
      itemBuilder: (BuildContext context, int index) {
        return OrderCard(order: foodlist[index]);
      },

    );
  }
}
