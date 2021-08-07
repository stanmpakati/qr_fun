import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQr extends StatefulWidget {
  const CreateQr({Key? key}) : super(key: key);

  @override
  _CreateQrState createState() => _CreateQrState();
}

class _CreateQrState extends State<CreateQr> {
  TextEditingController qrImageController = TextEditingController();

  // String firstString = '*151*1*1*$phoneNumber*$amount#'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's have fun with qr codes"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shrinkWrap: true,
        children: [
          Center(
            child: QrImage(
              data: qrImageController.text,
              size: 300,
              // embeddedImage: AssetImage('Asset.png'),
            ),
          ),
          SizedBox(height: 40),
          TextField(
            controller: qrImageController,
            decoration: InputDecoration(
              labelText: "Enter QR data",
            ),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
