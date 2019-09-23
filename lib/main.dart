import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RespondEvents(),
    );
  }
}

class RespondEvents extends StatefulWidget {
  @override
  _RespondEventsState createState() => _RespondEventsState();
}

class _RespondEventsState extends State<RespondEvents> {
  String text = 'Type into  the `TextFormField`';
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
              controller: _controller,
              onChanged: (String something) {
                setState(() {
                  text=_controller.text;
                });
              },
            ),
            // RaisedButton(
            //   child: Text('Submit'),
            //   onPressed: () {
            //     setState(() {
            //       text = _controller.text;
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}


