import 'package:flutter/material.dart';
import 'Payment.dart';

class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Payment mode'),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
          children:[
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                          Container(
                            padding: EdgeInsets.only(top:80.0),
                              alignment: Alignment.center,
                              child: Text('Choose payment mode',
                                      style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[800],
                                            ),
                                      ),
                          ),
                          SizedBox(height: 30.0),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=> Payment()));
                              } ,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.credit_card,size:16),
                                  ),
                                  TextSpan(
                                    text: '    Pay via credit card'
                                  ),
                                ]
                              )
                            ),
                          ),
                          SizedBox(height:20.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Payment()));
                            } ,
                            child: RichText(
                                text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.wifi,size:16),
                                      ),
                                      TextSpan(
                                          text: '    Pay via Google Pay'
                                      ),
                                    ]
                                )
                            ),
                          ),
                          SizedBox(height:20.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> Payment()));
                            } ,
                            child: RichText(
                                text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.credit_card,size:16),
                                      ),
                                      TextSpan(
                                          text: '    Pay via FPX '
                                      ),
                                    ]
                                )
                            ),
                          ),
                          SizedBox(height:20.0),
                          Padding(
                            padding: EdgeInsets.only(top:30.0),
                            child: RichText(
                              text: TextSpan(
                                children:[
                                  TextSpan(text: 'Amount Confirmation: RM '
                                  ),
                                  TextSpan(),
                              ]
                            ),
                          ),
                          ),
                        ],
                      ),
                    ]
              ),
      ),
      ]
        ),
        ),
      ),
    );
  }
}
