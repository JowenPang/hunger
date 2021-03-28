import 'package:flutter_app/MapTracker.dart';
import 'package:flutter_app/Orderlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Order.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderCard extends StatelessWidget {

  final Order order;
  LatLng providerLatLng;

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

              _getProviderLatLng(order.address);

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> MapTracker(providerAddress: order.address, providerLatLng: this.providerLatLng))
              );
            },
          ),
        )
      )
    );
  }

  Future _getProviderLatLng(providerAddress) async {
    List<Location> locations = await locationFromAddress(providerAddress);
    print('_getProviderLatLng has run');

    providerLatLng = LatLng(locations[0].latitude, locations[0].longitude);
  }
}





