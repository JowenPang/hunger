import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Order.dart';

import 'OrderCard.dart';


class Orderlist extends StatefulWidget {
  @override
  _OrderListViewState createState() => _OrderListViewState();
}


class _OrderListViewState extends State<Orderlist> {
  @override
  Widget build(BuildContext context) {

    final foodlist=Provider.of<List<Order>>(context);

    return ListView.builder(
      itemCount: foodlist.length,
      itemBuilder: (BuildContext context, int index) {
        return OrderCard(order: foodlist[index]);
      },

    );
  }
}
