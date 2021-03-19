import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      resizeToAvoidBottomInset: false,
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
  final TextEditingController _add1 = TextEditingController(text: '');
  final TextEditingController _add2 = TextEditingController(text: '');
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
            controller: _add1,
            keyboardType: TextInputType.number, //displays the digit keyboard
            decoration: InputDecoration(hintText: widget.q),
            onChanged: (t) {
              setState(() {});
            }),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('+'),
        ),
        TextField(
          controller: _add2,
          keyboardType: TextInputType.number, //displays the digit keyboard
          decoration: InputDecoration(hintText: widget.q),
          onChanged: (t) {
            setState(() {});
          },
        ),
        RaisedButton(
            child: Text(widget.e),
            onPressed: (_add1.text.isEmpty || _add2.text.isEmpty)
                ? null
                : () async {
                    var response = await http.get(Uri.parse("https://80fa3332fc98.ngrok.io/sum/${_add1.text}/${_add2.text}"));
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    setState(() {
                      _output = response.body;
                    });
                    // if (_add1.text.isEmpty || _add2.text.isEmpty) {
                    //   setState(() {
                    //     ans = null;
                    //     _output = 'Empty';
                    //   });
                    //   //this is a function that checks if input is valid
                    // } else if (checkInput(_add1.text.length, _add1.text) || checkInput(_add2.text.length, _add2.text)) {
                    //   setState(() {
                    //     ans = null;
                    //     _output = 'Invalid Input';
                    //   });
                    // }
                    // if (ans.toString().isNotEmpty) {
                    //   setState(() {
                    //     c1 = double.parse(_add1.text);
                    //     c2 = double.parse(_add2.text);
                    //     ans = c1 + c2;
                    //     _output = ans.toString();
                    //   });
                    // }
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
