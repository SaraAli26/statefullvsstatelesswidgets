import 'package:flutter/material.dart';

void main() => runApp(HomeScreen());

//Our root widget that contains the two widgets
// Stateless and stateful widgets
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Stateful Widget vs Stateless widget"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StatelessW(),
            StatefulW(),
          ],
        ),
      ),
    );
  }
}

// Our Stateless widget that only contains a Text
class StatelessW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("On / Off")],
    );
  }
}

// Our stateful widget that contains an icon, and we want to change
// The icon shape and color whenever we press it
// here we create the state for our stateful widget
class StatefulW extends StatefulWidget {
  @override
  _StatefulWState createState() => _StatefulWState();
}

class _StatefulWState extends State<StatefulW> {

  // Define the variable we need to change whenever clicking the icon
  bool on = false;
  Color color = Colors.black;

  //Here we created a method to handle the setState for us
  // it toggles the on variable which will eventually cause the change of icon
  // and also change the color of the icon
  void _onOff(){
    setState(() {
      on = !on;
      if (color == Colors.amber) {
        color = Colors.black;
      }
      else {
        color = Colors.amber;
      }
    });
  }

  //The Part that will rebuild every time the icon is pressed
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
              on ? Icons.wb_incandescent : Icons.wb_incandescent_outlined,
              color: color,
              size: 42),
          onPressed: () {
              _onOff();
          },
        )
      ],
    );
  }
}


