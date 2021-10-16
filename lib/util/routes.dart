import 'package:flutter/material.dart';
import 'package:qr_fun/pages/create-qr.dart';
import 'package:qr_fun/pages/home.dart';
import 'package:qr_fun/pages/scan-qr.dart';
import 'package:qr_fun/pages/send_money.dart';
import 'package:qr_fun/pages/recieve_money.dart';
import 'package:qr_fun/pages/settings_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // For routes that require arguments
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/scan':
        return MaterialPageRoute(builder: (_) => ScanQrPage());
      case '/generate':
        return MaterialPageRoute(builder: (_) => CreateQr());
      case '/send':
        return MaterialPageRoute(builder: (_) => SendMoneyPage());
      case '/recieve':
        return MaterialPageRoute(builder: (_) => RecieveMoneyPage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
