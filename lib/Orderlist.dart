import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Orderlist extends StatefulWidget {
  @override
  _OrderlistState createState() => _OrderlistState();
}

class _OrderlistState extends State<Orderlist> {
  @override
  Widget build(BuildContext context) {

    final foodlist=Provider.of<QuerySnapshot>(context);
    for(var doc in foodlist.documents){
      print(doc.data);
    }
    return Container(


    );
  }
}
