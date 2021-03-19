import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      home: Increment(),
    );
  }
}

class Increment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Center(child: Text('Click Counter'))),
      body: Center(
        child: ClkCntr(
          clickme: 'CLICK ME',
        ),
      ),
    );
  }
}

class ClkCntr extends StatefulWidget {
  //initialize
  final String clickme;

//constructors
  ClkCntr({this.clickme});
  @override
  //Creates the mutable state for this widget at a given location in the tree.
  _ClkCntrState createState() => _ClkCntrState();
}

class _ClkCntrState extends State<ClkCntr> {
  int _cnt = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Align(
                child: Text(
          //a part of a language in Dart
          //Interlopation string
          '$_cnt',
          style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
        ))),
        RaisedButton(
            color: Colors.lightBlue[200],
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 15.0),
            onPressed: () {
              //When the widget’s state changes,
              //the state object calls setState(),
              //telling the framework to redraw the widget.
              setState(() {
                _cnt++;
              });
            },
            child: Text(
              widget.clickme,
            )),
      ],
    );
  }
}
