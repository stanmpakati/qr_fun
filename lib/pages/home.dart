import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

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
        title: Text('Choose action'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/scan'),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(
                    'Scan QR',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/generate'),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(
                    'Generate QR',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => launch("tel://*151#"),
                child: Text('Dial something'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await UssdAdvanced.sendUssd(code: '*151#', subscriptionId: 2);
                },
                child: Text('Dial something 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
