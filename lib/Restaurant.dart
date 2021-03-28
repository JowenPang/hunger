import 'package:flutter/material.dart';
import 'package:flutter_app/services/database.dart';
import './question.dart';


class Restaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text("Restaurant Page"),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {}),
          ],
        ),
        body: Column(children: [Question("having excess food to donate?"),
          IconButton(icon: Icon(Icons.add_circle_outline_rounded),
              iconSize: 50,
              color: Colors.red,
              hoverColor: Colors.red,
              onPressed: () => newForm(context)),
        ],
        ),
      ),
    );
  }

  //pop up form for each food donation , only need the information of no of pax and description
  newForm(BuildContext context) {

    int count=1;
    TextEditingController paxController = TextEditingController();
    TextEditingController describeController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              children: [
                TextFormField(
                  /*validator: (value){
                    if(value==null){
                      return "Please enter something"
                    }
                  },*/
                  decoration: InputDecoration(
                    labelText: "Number of Pax"
                  ),
                  autofocus: true,
                  controller: paxController ,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Description"
                  ),
                  controller: describeController,
                ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Address"
                ),
                controller: addressController,
              ),
              ]),
               actions:<Widget>[
                    ElevatedButton(
                        onPressed: () {
                          DatabaseService().updateDatabase(count.toString(),paxController.text,describeController.text,addressController.text);
                          Navigator.of(context).pop(true);   //to close the pop up form
                          count++;
                        },
                      autofocus: true,
                        child: Text("Submit"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          //hide back the pop up form
                        },
                        child: Text("Cancel"))
                  ],
          );
        }
    );
  }
}
