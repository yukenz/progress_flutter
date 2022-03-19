import 'package:flutter/material.dart';

void pertemuan6() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    onGenerateRoute: route.generateRoute,
    theme: ThemeData.dark(),
  ));
}

class route {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/form':
        return MaterialPageRoute(builder: (_) => BelajarForm());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Form"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // TextField(),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: Susilo Bambang",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  String button1 = "Tap Untuk ke Form";
  String button2 = "Tap Halaman lain";

  @override
  Widget build(BuildContext context) {
    void button1press() {
      Navigator.pushNamed(context, '/form');
    }

    void button2press() {
      Navigator.pushNamed(context, '/halaman-404');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Routing | Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: button1press,
              child: Text(button1),
            ),
            RaisedButton(
              onPressed: button2press,
              child: Text(button2),
            ),
          ],
        ),
      ),
    );
  }
}
