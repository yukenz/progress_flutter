import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ini Appbar"),
          primary: true,
          toolbarTextStyle: TextStyle(backgroundColor: Colors.red),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(child: Text("INI BODY")),
      ),
    );
  }
}
