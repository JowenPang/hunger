import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}


class _PaymentState extends State<Payment> {

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
          title: Text('Verify payment card'),
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),
        body: Center(
          child: CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused, //true when you want to show cvv(back) view
          ),
        ),
      ),
    );
  }
}

