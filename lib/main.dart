import 'package:flutter/material.dart';
import 'package:tasted/screens/add_review_screen.dart';
import 'package:tasted/screens/feed_screen.dart';
import 'package:tasted/screens/login_screen.dart';

void main() => runApp(TastedApp());

class TastedApp extends StatelessWidget {
  static const LOGIN_SCREEN = '/login';
  static const FEED_SCREEN = '/feed';
  static const ADD_REVIEW = '/addReview';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasted',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        LOGIN_SCREEN: (context) => LoginScreen(),
        FEED_SCREEN: (context) => Feed(),
        ADD_REVIEW: (context) => AddReview(),
      },
    );
  }
}
