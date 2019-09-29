import 'package:flutter/material.dart';
import 'package:tasted/models/review.dart';
import 'package:tasted/persistence/review_repository.dart';
import 'package:tasted/screens/add_review_screen.dart';
import 'package:tasted/widgets/review_card.dart';

class Feed extends StatefulWidget {
  final ReviewRepository repository = ReviewRepository();
  @override
  _FeedState createState() => _FeedState(repository.allReviews);
}

class _FeedState extends State<Feed> {
  final List<Review> _reviews;

  _FeedState(this._reviews);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: ListView.builder(
          itemCount: _reviews.length,
          itemBuilder: (context, index) {
            return ReviewCard(_reviews[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddReview())),
      ),
    );
  }
}
