import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final CollectionReference foodDonation= Firestore.instance.collection('food');

  Future updateDatabase(String pax,String description) async{
    foodDonation.add({
      'pax': pax,
      'description': description
    });
    return;
  }
  //get the order stream from database
  Stream<QuerySnapshot> get newOrder{
    return foodDonation.snapshots();
  }
}