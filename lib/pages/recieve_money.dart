import 'package:flutter/material.dart';

class RecieveMoneyPage extends StatefulWidget {
  const RecieveMoneyPage({Key? key}) : super(key: key);

  @override
  RecieveMoneyPageState createState() => RecieveMoneyPageState();
}

class RecieveMoneyPageState extends State<RecieveMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recieve Money'),
      ),
    );
  }
}
