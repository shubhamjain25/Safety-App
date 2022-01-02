import 'package:flutter/material.dart';
import 'package:safety_app/screens/landing_page.dart';

void main() {
  runApp(SafetyApp());
}

class SafetyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.grey[600],
        accentColor: Color(0xFFFF1E00),
      ),
      home: LandingPage(),
    );
  }
}


