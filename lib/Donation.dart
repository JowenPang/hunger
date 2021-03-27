import 'package:flutter/material.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/Transaction.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {

  var _formkey = GlobalKey<FormState>();

  bool _buttonPressed = false;
  TextEditingController _amountController = TextEditingController();
  bool _validateAmount = false;

  // method to display value in TextField when button is clicked
  void _buttonAmount (String buttonValue) {
    setState(() {
      _amountController.text = buttonValue;
      if (_buttonPressed){
        print('Donation : RM '+ buttonValue);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Donations'),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        
        body: Container(
          padding: const EdgeInsets.all(8.0),
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,40,8.0,0),
                  child: Text('Enter your preferred amount',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,20.0,30.0,20.0),
                  child: TextField(
                    controller: _amountController,

                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixText: 'RM  ',
                      prefixStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      hintText: "XX.XX",
                      errorText: _validateAmount ? "Value cannot be empty" : null,
                      labelText: "Amount",
                      labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                  ),
                      border: OutlineInputBorder(),
                      fillColor: Colors.grey[40],
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,

                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                             child: Text('RM 20'),
                             onPressed: () {
                                _buttonAmount('20.00');
                             }

                           ),
                        ElevatedButton(
                              child: Text('RM 30'),
                              onPressed: () {
                                _buttonAmount('30.00');
                              }
                          ),
                        ElevatedButton(
                              child: Text('RM 50'),
                              onPressed: () {
                                _buttonAmount('50.00');
                              }
                          ),
                    ],
                  ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              child: Text('RM 75'),
                              onPressed: () {
                                _buttonAmount('75.00');
                              }
                          ),
                          ElevatedButton(
                              child: Text('RM100'),
                              onPressed: () {
                                _buttonAmount('100.00');
                              }
                          ),
                          ElevatedButton(
                                child: Text('RM150'),
                                onPressed: () {
                                _buttonAmount('150.00');
                                }
                            ),
                        ]
                      ),
                    ]
                ),
                ),
                    SizedBox(height:20.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: _buttonPressed ? MaterialStateProperty.all<Color>(Colors.green) : MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),
                          child: Text('Confirm amount'),
                        onPressed: () {
                        DatabaseService().updateDonationDatabase(_amountController.text);
                        setState(() {
                          if (_amountController.text.isEmpty){
                            _validateAmount = true;
                            _buttonPressed = false;
                          } else {
                            _validateAmount = false;
                            _buttonPressed = true;
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> Transaction()));
                            print('Donation amount : RM' + _amountController.text);
                          }
                        });

                        },

                    ),

              ]
            ),
          ),

      ),
    );
  }
}

