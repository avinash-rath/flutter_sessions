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
            body: Container(),
          );
  }
}