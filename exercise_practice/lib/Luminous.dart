import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luminous',
      home: Luminous(),
    );
  }
}

class Luminous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Luminous')),
      ),
      body: Suga(),
    );
  }
}

class Suga extends StatefulWidget {
  @override
  _SugaState createState() => _SugaState();
}

class _SugaState extends State<Suga> {
  bool val = false;
  String lights = 'assets/off.png';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Image.asset(
            lights,
            width: 200.0,
            height: 200.0,
          ),
        ),
        Switch(
            value: val, //switch is initally off
            activeColor: Colors.yellowAccent,
            activeTrackColor: Colors.lightBlueAccent,
            onChanged: (newVal) {
              setState(() {
                val = newVal;
                if (newVal == false) {
                  lights = 'assets/off.png';
                } else
                  lights = 'assets/on.png';
              });
            })
      ],
    );
  }
}
