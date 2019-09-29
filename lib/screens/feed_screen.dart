import 'package:flutter/material.dart';
import 'package:tasted/screens/add_review_screen.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Review"),
            subtitle: Text("Reviewed by Axel"),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Review"),
            subtitle: Text("Reviewed by Axel"),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddReview())),
      ),
    );
  }
}
