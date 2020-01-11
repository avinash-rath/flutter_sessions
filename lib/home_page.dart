import 'package:flutter/material.dart';
import 'package:flutter_sessions/tile_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  TabController controller;
  Future details;

   getData() async {
     http.Response response = await http.get('http://www.mocky.io/v2/5e198f86310000462484b511');
     var listData = tileModelFromJson(response.body);
     return listData;
   }

  @override
  void initState() {
    super.initState();
    controller = new TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
    details = getData();
  }


  @override
  Widget build(BuildContext context) {
    Color whatsAppColor = Color(0xFF32642E);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: controller,
          tabs: <Widget>[
            Tab(
              child: Text("chats"),
            ),
            Tab(
              child: Text("status"),
            ),
            Tab(
              child: Text("calls"),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              //TODO
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //TODO
            },
          )
        ],
        backgroundColor: whatsAppColor,
        title: Text('WhatsApp'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO
        },
        child: Icon(Icons.chat),
        backgroundColor: whatsAppColor,
      ),
      body: FutureBuilder(
        future: details,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch(snapshot.connectionState){
            
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
             var det = snapshot.data;
              return ListView.builder(
          itemCount: det.length,
          itemBuilder: (BuildContext context, int count) {
            return WhatsAppCard(
              name: det[count].name,
              message: det[count].message,
              time: det[count].time,
              messageStatus: det[count].messageStatus,
            );
          });
              break;
          }
        },
      ),
    );
  }
}

class WhatsAppCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String messageStatus;

  WhatsAppCard({
    this.message,
    this.name,
    this.messageStatus,
    this.time,
  });

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
            child: Icon(
              Icons.account_circle,
              size: 75.0,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.grey),
                    )
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
            child: Text(time),
          ),
        ],
      ),
    );
  }
}

class WhatsAppDetails {
  String name;
  String message;
  String time;
  MessageStatus status;
  WhatsAppDetails(
    this.name,
    this.message,
    this.time,
    this.status,
  );
}

enum MessageStatus { pending, delivered, received, seen }
