import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'Successful.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify card'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardType: CardType.mastercard,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              height: 200,
              width: MediaQuery.of(context).size.width,
              animationDuration: Duration(milliseconds: 1000),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      onCreditCardModelChange: onModelChange,
                      formKey: formKey, // Required
                      themeColor: Colors.red,
                      cardNumber: cardNumber,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      expiryDate: expiryDate,
                      obscureCvv: true,
                      obscureNumber: true,

                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                      ),
                    ),

                    ElevatedButton(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: const Text(
                            'Verify',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (!formKey.currentState.validate()) {
                            print('invalid!');
                          } else {
                            print('valid!');
                            print('[Credit Card Credentials]');
                            print('Name: ${cardHolderName}');
                            print('Account Number: ${cardNumber}');
                            print('CVV Code: ${cvvCode}');
                            print('Expiry Date: ${expiryDate}');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Successful()));
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
    void onModelChange(CreditCardModel model){
      setState(() {
        cardNumber = model.cardNumber;
        expiryDate = model.expiryDate;
        cardHolderName = model.cardHolderName;
        cvvCode = model.cvvCode;
        isCvvFocused = model.isCvvFocused;
      });
    }
}
