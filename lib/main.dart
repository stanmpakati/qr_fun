import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's have fun with qr codes"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        shrinkWrap: true,
        children: [
          Center(
            child: QrImage(data: 'I am Stan and I love flutter', size: 300),
          ),
        ],
      ),
    );
  }
}
