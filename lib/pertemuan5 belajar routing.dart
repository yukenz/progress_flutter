import 'package:flutter/material.dart';

void pertemuan5() {
  runApp(MaterialApp(
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
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());
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
  String button1 = "Tap Untuk ke AboutPage";
  String button2 = "Tap Halaman lain";

  @override
  Widget build(BuildContext context) {
    void button1press() {
      Navigator.pushNamed(context, '/about');
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

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kembali'),
        ),
      ),
    );
  }
}
