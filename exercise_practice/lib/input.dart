import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

//root
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add me Up',
      home: MyHomeScreen(),
    );
  }
}


class MyHomeScreen extends StatefulWidget {
  @override
  //Creates the mutable state for this widget at a given location in the tree.
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  //initialize
  String output = "";
  double ans = 0;
  double add1 = 0, add2 = 0;

  @override
  //this is where we describe our UI.
  //In this case, it is the Scaffold
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(child: Text('Add me up')),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //top bottom
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                textAlign: TextAlign.left,
                //displays the digit keyboard
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: '?'),
                //responsible for inputting only digits
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (val) {
                  //val prints the current text field
                  //parses the string to double.
                  add1 = double.parse(val);
                  print(val);
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              TextField(
                //responsible for inputting only digits
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //displays the digit keyboard
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: '?'),
                onChanged: (val) {
                  //val prints the current text field
                  //parses the string to double.
                  add2 = double.parse(val);
                  print(val);
                },
              ),
              RaisedButton(
                  child: Text('='),
                  onPressed: () {
                    //print(add1);
                    //print(add2);

                    ans = add1 + add2;
                    if (ans.toString().isNotEmpty) {
                      setState(() {
                        output = ans.toString();
                      });
                      //print(ans);
                    }
                  }),
              Text(
                output,
                style: TextStyle(fontSize: 80.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
