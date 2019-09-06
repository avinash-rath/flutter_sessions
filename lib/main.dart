// Importing material.dart provides us with the basic tools 
// and elements needed to create a Material Design App.
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
// The program starts from main() function.

// MyApp(here) is the starting point of the app.
class MyApp extends StatelessWidget {
  
  // `build` method always needs to be overriden in a class 
  // extending StatelessWidget or a StatefulWidget.
  // `build` method defines what gets rendered on the mobile screen.
  
  @override
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
          home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
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
              backgroundColor: whatsAppColor,
              title: Text('WhatsApp'),
            ),
            body: Container(),
          );
  }
}
