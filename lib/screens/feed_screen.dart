import 'package:flutter/material.dart';
import 'package:tasted/models/review.dart';
import 'package:tasted/persistence/review_repository.dart';
import 'package:tasted/screens/add_review_screen.dart';
import 'package:tasted/widgets/review_card.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final ReviewRepository repository = ReviewRepository();
  List<Review> _reviews;

  _FeedState();

  @override
  void initState() {
    _getReviews();
    super.initState();
  }

  void _getReviews() async {
    var allReviews = await repository.allReviews();
    setState(() {
      _reviews = allReviews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ReviewCard(_reviews[index]);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddReview())),
      ),
    );
  }
}
