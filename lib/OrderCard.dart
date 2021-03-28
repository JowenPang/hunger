import 'package:flutter_app/MapTracker.dart';
import 'package:flutter_app/Orderlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Order.dart';
import 'package:flutter_app/services/database.dart';

class OrderCard extends StatelessWidget {

  final Order order;
  OrderCard({this.order});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20,6,20,0),
        child: ListTile(
          title: Text(order.description ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.pax + ' pax'),
              Text(order.address),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.check_circle_rounded),
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> MapTracker(providerAddress: order.address))

              );
              //DatabaseService().deleteData(order.description);
            },
          ),
        )
      )
    );
  }
}





