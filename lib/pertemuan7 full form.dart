import 'package:flutter/material.dart';

void pertemuan7() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    onGenerateRoute: route.generateRoute,
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

class HomePage extends StatelessWidget {
  String button1 = "Tap Untuk ke Belajar Form";
  String button2 = "Tap Halaman Error tidak ada";

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: button1press,
                child: Text(button1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: button2press,
                child: Text(button2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  BorderRadius semuaradius = BorderRadius.circular(12.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Form"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "contoh: Susilo Bambang",
                      labelText: "Nama Lengkap",
                      icon: Icon(Icons.people),
                      border: OutlineInputBorder(borderRadius: semuaradius),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(borderRadius: semuaradius),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Alamat",
                      hintText: "Pamulang",
                      icon: Icon(Icons.home),
                      border: OutlineInputBorder(borderRadius: semuaradius),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                CheckboxListTile(
                  title: Text('Belajar Dasar Flutter'),
                  subtitle: Text('Dart, widget, http'),
                  value: nilaiCheckBox,
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      nilaiCheckBox = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Backend Programming'),
                  subtitle: Text('Dart, Nodejs, PHP, Java, dll'),
                  value: nilaiSwitch,
                  activeTrackColor: Colors.pink[100],
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitch = value;
                    });
                  },
                ),
                Slider(
                  value: nilaiSlider,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      nilaiSlider = value;
                    });
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
            ),
          ),
        ),
      ),
    );
  }
}
