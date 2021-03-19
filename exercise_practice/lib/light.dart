import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luminous',
      home: Light(),
    );
  }
}

class Light extends StatefulWidget {
  @override
  //Creates the mutable state for this widget at a given location in the tree.
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
  //initialize
  String lights = 'assets/off.png';

//here, we control what buttons are selected
//with a variable inside a stateful widget
  List<bool> _isSelected = [false];

  @override
  Widget build(BuildContext context) {
    //this is where we describe our UI.
    //In this case, it is the Scaffold
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(child: Text('Luminous')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //centers from left
          Center(
            child: Image.asset(
              lights,
              width: 200.0,
              height: 200.0,
            ),
          ),
          //creates a horizontal set of buttons
          //correction: use switch (activeColor)
          ToggleButtons(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text('Lights'),
              ),
            ],
            isSelected: _isSelected,
            onPressed: (int index) {
              setState(() {
                //index to identify the value of the list
                //In my case, I have only 1 which is index 0
                _isSelected[index] = !_isSelected[index];
                // print(!_isSelected[index]); //this is responsible for true false
                if (!_isSelected[index] == true) {
                  lights = 'assets/off.png';
                } else {
                  lights = 'assets/on.png';
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

