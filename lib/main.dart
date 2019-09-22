import 'package:flutter/material.dart';
import 'package:tasted/screens/login_screen.dart';

void main() => runApp(TastedApp());

class TastedApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasted',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
