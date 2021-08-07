import 'package:flutter/material.dart';
import 'package:qr_fun/pages/create-qr.dart';
import 'package:qr_fun/pages/home.dart';
import 'package:qr_fun/pages/scan-qr.dart';

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
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
