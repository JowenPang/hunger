import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Order.dart';

class DatabaseService{

  final CollectionReference foodDonation= Firestore.instance.collection('food');
  final CollectionReference donation= Firestore.instance.collection('donation');


  Future updateDatabase(String pax,String description,String address) async{
    foodDonation.add({
      'pax': pax,
      'description': description,
      'address': address,
    });
    return;
  }

  Future updateDonationDatabase(String amount) async{
    donation.add({
      'donation': donation
    });
    return;
  }


  List<Order> _ordersFromSnapshot(QuerySnapshot snapshot){
    //previously just a snapshot of the whole list , everytime we need one order , it will need to loop the whole list
    //now mapping it to List of each Order object , so that we can easily add and remove order
    return snapshot.documents.map((doc) {

      return Order(  //everytime will cycle through snapshot.document's doc then assign the data in doc to pax and description
          pax : doc.data['pax'] ?? '',
          description : doc.data['description'] ?? '',
          address : doc.data['address'] ?? ''
      );     //?? is when it does not exist then it will replace with null
    }).toList();   //return  a list of orders
  }


  //get the order stream from database
  Stream<List<Order>> get newOrder{
    return foodDonation.snapshots().map(_ordersFromSnapshot);
  }
}