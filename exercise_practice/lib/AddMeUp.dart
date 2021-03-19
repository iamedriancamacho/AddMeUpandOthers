import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//root
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add me Up',
      home: AddMeUp(),
    );
  }
}

class AddMeUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ignores the bottom padding when opening the keyboard
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(child: Text('Add Me Up')),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TxtInput(
          q: '?',
          e: '=',
        ),
      ),
    );
  }
}

class TxtInput extends StatefulWidget {
  //initialize
  final String q;
  final String e;

//constructor
  TxtInput({this.e, this.q});
  @override
  //Creates the mutable state for this widget at a given location in the tree.
  _TxtInputState createState() => _TxtInputState();
}

class _TxtInputState extends State<TxtInput> {
  String _add1 = '', _add2 = ''; //captures the input
  String _output = '0.0'; //the Text
  double c1, c2; //parse
  double ans = 0; //answer
  bool flag = false; //check valid inputs

  @override
  Widget build(BuildContext context) {
    return Column(
      //top bottom
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number, //displays the digit keyboard
          decoration: InputDecoration(hintText: widget.q),
          onChanged: (val) {
            //val prints the current textfield
            _add1 = val;
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('+'),
        ),
        TextField(
          keyboardType: TextInputType.number, //displays the digit keyboard
          decoration: InputDecoration(hintText: widget.q),
          onChanged: (val) {
            //val prints the curent textfield
            _add2 = val;
          },
        ),
        RaisedButton(
            child: Text(widget.e),
            onPressed: () {
              if (_add1.isEmpty || _add2.isEmpty) {
                setState(() {
                  ans = null;
                  _output = 'Empty';
                });
                //this is a function that checks if input is valid
              } else if (checkInput(_add1.length, _add1) ||
                  checkInput(_add2.length, _add2)) {
                setState(() {
                  ans = null;
                  _output = 'Invalid Input';
                });
              }
              if (ans.toString().isNotEmpty) {
                setState(() {
                  c1 = double.parse(_add1);
                  c2 = double.parse(_add2);
                  ans = c1 + c2;
                  _output = ans.toString();
                });
              }
            }),
        Text(
          '$_output',
          style: TextStyle(fontSize: 80.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  bool checkInput(int val, String x) {
    for (var i = 0; i < val; i++) {
      if (x.contains((RegExp(r'^[a-zA-Z_\-=@,\;]+$')), i)) {
        flag = true;
      }
    }
    return flag; //returns true if string is not a float.
  }
}
