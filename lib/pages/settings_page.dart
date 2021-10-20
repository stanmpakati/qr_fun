import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _settingsFormKey = GlobalKey<FormState>();
  final _simNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late Future<String> phoneNumber;
  late Future<int> simNumber;

  @override
  void initState() {
    super.initState();

    simNumber =
        prefs.then((SharedPreferences _prefs) => _prefs.getInt('sim') ?? 0);

    phoneNumber = prefs
        .then((SharedPreferences _prefs) => _prefs.getString('phone') ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: FutureBuilder<String>(
          future: phoneNumber,
          builder: (context, snapshot) {
            return Form(
              key: _settingsFormKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                children: [
                  TextFormField(
                    controller: _simNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                        hintText: 'Choose sim number', labelText: 'Sim Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'What sim number?';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 14),

                  // Default phone number
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      hintText: 'Choose default number',
                      labelText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'What phone number?';
                      }
                      if (value.startsWith('263')) {
                        value = '0' + value.split('263')[1];
                        print(value);
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 24),

                  // Submit
                  ElevatedButton(onPressed: submit, child: Text('Submit'))
                ],
              ),
            );
          }),
    );
  }

  submit() async {
    print(_phoneNumberController.text);
    phoneNumber = prefs
        .then(
            (_prefs) => _prefs.setString("phone", _phoneNumberController.text))
        .then((bool success) {
      return phoneNumber;
    });

    prefs.then((SharedPreferences _prefs) => print(_prefs.getString('phone')));
  }
}
