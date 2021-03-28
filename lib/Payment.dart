import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'Sucessful.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}


class _PaymentState extends State<Payment> {

  TextEditingController _AccountNumberController = TextEditingController();
  TextEditingController _CVVNumberController = TextEditingController();
  TextEditingController _CardHolderController = TextEditingController();
  TextEditingController _ExpiryDateController = TextEditingController();
  bool _validateCardHolder = false;
  bool _validateExpiryDate = false;
  bool _validateAccountNumber = false;
  bool _validateCVV = false;
  bool _secureCVV = false;



  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Verify payment'),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('    Kindly verify your payment card.',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
                ),
              ),
              Center(
              child: CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused, //true when you want to show cvv(back) view
              ),
            ),
              SizedBox(height: 20.0),

              Container(
                padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,0.0),
                height: 70.0,
                child: TextField(
                  controller: _CardHolderController,

                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: "eg. Johnson Lai",
                    errorText: _validateCardHolder ? "This is a required field." : null,
                    labelText: "Card Holder Name",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey[40],
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),

              SizedBox(height: 15.0),

              Container(
                padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,0.0),
                height: 70.0,
                child: TextField(
                  controller: _AccountNumberController,

                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: "eg. 123456789012",
                    errorText: _validateAccountNumber ? "This is a required field." : null,
                    labelText: "Account No.",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey[40],
                    filled: true,
                  ),
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(height: 10.0),

              Container(
                padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,0.0),
                height: 70.0,
                child: TextField(
                  controller: _CVVNumberController,

                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_secureCVV ? Icons.security : Icons.remove_red_eye_outlined),
                      onPressed: () {
                        setState(() {
                          _secureCVV = !_secureCVV;
                        });
                      },
                    ),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: "eg. 123",
                    errorText: _validateCVV ? "This is a required field." : null,
                    labelText: "CVV No.",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey[40],
                    filled: true,
                  ),
                  obscureText: _secureCVV,
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                ),
              ),

              SizedBox(height: 10.0),

              Container(
                padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,0.0),
                height: 70.0,
                child: TextField(
                  controller: _ExpiryDateController,


                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: "eg. 09/21",
                    errorText: _validateExpiryDate ? "Invalid date." : null,
                    labelText: "Expiry Date",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey[40],
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                  maxLength: 4,

                ),
              ),

              SizedBox(height:20.0),

              Center(
                child: ElevatedButton(onPressed: () {
                  setState(() {
                    if(_AccountNumberController.text.isEmpty || _CVVNumberController.text.isEmpty || _CardHolderController.text.isEmpty || _ExpiryDateController.text.isEmpty ) {
                      if (_AccountNumberController.text.isEmpty) {
                        _validateAccountNumber = true;
                      }
                      if (_CVVNumberController.text.isEmpty) {
                        _validateCVV = true;
                      }
                      if (_CardHolderController.text.isEmpty) {
                        _validateCardHolder = true;
                      }
                      if (_ExpiryDateController.text.isEmpty) {
                        _validateExpiryDate = true;
                      }
                    } else {
                      _validateExpiryDate = false;
                      _validateCardHolder = false;
                      _validateCVV = false;
                      _validateAccountNumber = false;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> Successful()));
                    }
                  });
                      }, child: Text('Verify',
                      style: TextStyle(
                                fontSize: 16,
                            ),
                        ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}

