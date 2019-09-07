import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color whatsAppColor = Color(0xFF32642E);
    return Scaffold(
            appBar: AppBar(
              backgroundColor: whatsAppColor,
              title: Text('WhatsApp'),
            ),
            body: ListView.builder(
              itemCount: 10,
                itemBuilder:
                (BuildContext context, int count) {
                return WhatsAppCard();
                }),
          );
  }
}

class WhatsAppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.0,
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.account_circle, size: 75.0,
              color: Colors.grey.withOpacity(0.7),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Avinash', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.check, size: 15.0, color: Colors.grey,),
                    Text('Hi!', style: TextStyle(
                        color: Colors.grey
                    ),)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.0),
            child: Text('15:32'),
          ),
        ],
      ),
    );
  }
}
