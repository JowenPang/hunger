import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Order{


  String description;
  String pax;

  Order({this.pax,this.description});
}