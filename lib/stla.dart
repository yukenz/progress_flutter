import 'package:flutter/material.dart';

class mystla extends StatefulWidget {
  const mystla({Key key}) : super(key: key);

  @override
  State<mystla> createState() => _mystlaState();
}

class _mystlaState extends State<mystla> {
  int xval = 10;

  void onpressx() {
    setState(() {
      xval += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ini appbar")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(xval.toString(),
                  style: TextStyle(fontSize: 40 + xval.toDouble())),
              RaisedButton.icon(
                icon: Icon(Icons.accessibility_new),
                label: Text("lol"),
                padding: EdgeInsets.all(100),
                onPressed: onpressx,
                color: Color.fromARGB(9, 91, 9, 206),
                splashColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
