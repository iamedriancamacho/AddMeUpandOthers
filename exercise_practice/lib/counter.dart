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
      home: MyHomePage(title: 'Click Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //instance
  final String title;
  //constructors
  MyHomePage({this.title});
  @override
  //Creates the mutable state for this widget at a given location in the tree.
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //initialize
  int _counter = 0;

  void _incrementCounter() {
    //When the widget’s state changes,
    //the state object calls setState(),
    //telling the framework to redraw the widget.
    setState(() {
      _counter++;
    });
  }

  @override
  //this is where we describe our UI.
  //In this case, it is the Scaffold
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Align(
                child: Text(
                  //a part of a language in Dart
                  //Template literals in JavaScript
                  //Interlopation string
                  '$_counter',
                  style:
                      TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                color: Colors.lightBlue[200],
                child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 150.0),
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: Text('CLICK ME')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
