import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pertemuan1/pertemuan%206%20widget%20form.dart';
import 'package:pertemuan1/pertemuan5%20belajar%20routing.dart';
import 'stla.dart';

void main() => pertemuan6();

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

class cuper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.red,
          middle: Text("dwa"),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(100),
            child: Text("adw"),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.black],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomStart,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      title: "dawdwe",
    );
  }
}
