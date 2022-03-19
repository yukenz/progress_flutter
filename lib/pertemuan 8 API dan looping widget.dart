import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void pertemuan8() {
  runApp(MaterialApp(
    home: BelajarGetData(),
  ));
}

class BelajarGetData extends StatelessWidget {
  final String apiUrl = "https://reqres.in/api/users?per_page=15";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    int x = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar GET HTTP'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (x == 1) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(snapshot.data[index]['avatar']),
                        ),
                        title: Text(snapshot.data[index]['first_name'] +
                            " " +
                            snapshot.data[index]['last_name']),
                        subtitle: Text(snapshot.data[index]['email']),
                      );
                    } else if (x == 2) {
                      return Container(
                        child: Row(
                          children: [
                            Image(
                                image: NetworkImage(
                                    snapshot.data[index]['avatar'])),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("first name :"),
                            ),
                            Text(snapshot.data[index]['first_name']),
                          ],
                        ),
                      );
                    }
                  });
            } else {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}
