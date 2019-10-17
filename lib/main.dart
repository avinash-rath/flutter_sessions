// Importing material.dart provides us with the basic tools
// and elements needed to create a Material Design App.
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
// The program starts from main() function.

// MyApp(here) is the starting point of the app.
class MyApp extends StatefulWidget {
// overriding `createState` method
// extending StatefulWidget Widget
  @override
// underscore '_' defines a variable as private.
// It is the part of the dart language
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  // `build` method always needs to be overriden in a class
  // extending StatelessWidget or a StatefulWidget.
  // `build` method defines what gets rendered on the mobile screen.
  Widget build(BuildContext context) {
    // Since we want to run an App in the main method, and we have provided
    // MyApp as the app that we want to run, we must return an App.
    // That is done here by a MaterialApp object.
    return MaterialApp(
        // `debugShowCheckedModeBanner` is set to `false` in order to remove
        // debug banner that is visible by default on topRight corner of the
        // app.
        debugShowCheckedModeBanner: false,
        // The `home` for our app is a HomePage class object(defined by us.)
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // `initState()` is a function which is used to initiliaze the
    // state.
    // But we need to initialize the state of the parent class from
    // which we have inherite our class or widget. We use `super` keyword for
    // for defining that we want to call the initState() function of the
    // parent class

    // `super` is the object of the parent class and `this` is the object
    // of the class of which function is being called.

    // for more understanding of `super` and `this`, study about the
    // OOP paradigm (Object Orientation Programming)
    super.initState();
    controller = new TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Color class objects help define colors through either a Color()
    // constructor that takes a hexadecimal value or via a Colors enum.
    Color whatsAppColor = Color(0xFF32642E);
    // Scaffold is what finally gets rendered on the screen. Provides the
    // developer with basic tools as `appBar`,`body`,`drawer` etc.
    return Scaffold(
      // appBar property takes an AppBar class object. AppBar defines many
      // properties, as in `title`, `backgroundColor`, `centerTitle`,
      // `actions`, etc.
      appBar: AppBar(
        // bottom property is used to add anything to the bottom of the app
        // bar provided by the Scaffold
        bottom: TabBar(
          controller: controller,
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int count) {
            return WhatsAppCard();
          }),
    );
  }
}

class WhatsAppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //A Container is a convenience widget that combines common
    //painting, positioning, and sizing widgets.

    //We can only add one child to the Container
    // as it is a Single-child layout widget.
    return Container(
      height: 95.0,
      // When passing layout constraints to padding, it shrinks the constraints
      // by the given padding
      // causing the child to layout at a smaller size.

      // Here we are giving the child widget a padding of 10 pixels.
      padding: EdgeInsets.all(10.0),
      // Row widget is used to define a row in the given context
      child: Row(
        // Row is one of the three widgets which is having property children
        // which is used for adding multiple widgets instead of a single widget to it

        // there are two alignment properties present i.e. mainAxisAlignment and crossAxisAlignment
        // mainAxisAlignment is use to align the main axis where crossAxisAlignment is used to
        // align the axis perpendicular to the main axis

        // Here the vertical axis is perpendicular to main axis as Row's main axis is defined
        // horizontally
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            // Icon class is used to add an icon.
            // It defined many properties and we are using `size` and `color`
            // size is used to define the size of icon in pixels
            // color is used to change the color of the icon, default color
            // of the icon is blue
            child: Icon(
              // Using account icon (The empty user icon)
              Icons.account_circle,
              size: 75.0,
              // Using grey color with opacity to ensure that icon doesn't have any transparency
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              // Just like Row, Column is also one of the three widgets which is having children property

              // there are two alignment properties present i.e. mainAxisAlignment and crossAxisAlignment
              // mainAxisAlignment is use to align the main axis where crossAxisAlignment is used to
              // align the axis perpendicular to the main axis

              // Here the horizontal axis is perpendicular to the main axis as Column's
              // main axis is defined vertically
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Text widget is used to add text.
                // It is having different properties like `style`, `textAlign`,
                // `textDirection` and many more
                Text(
                  'Avinash',
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
                      'Hi!',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          // Expanded widget is used to make the child of Row, Column
          // or Flex expand to fill the available space along the main axis
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
