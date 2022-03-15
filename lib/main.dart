import 'package:flutter/material.dart';

void main() => runApp(containerlineargradient());

class app1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ini Appbar"),
          primary: true,
          toolbarTextStyle: TextStyle(backgroundColor: Colors.red),
        ),
        body: Center(
          child: Text("INI BODY"),
        ),
      ),
    );
  }
}

class containerlineargradient extends StatelessWidget {
  const containerlineargradient({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
        ))),
      ),
    );
  }
}
