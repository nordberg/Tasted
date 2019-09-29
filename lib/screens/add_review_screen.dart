import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class AddReview extends StatefulWidget {
  @override
  _AddReviewState createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final reviewController = TextEditingController();
  String _restaurant = '';
  double _rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add review"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              helperText: 'Restaurant',
            ),
            controller: reviewController,
            onFieldSubmitted: (value) {
              setState(() {
                this._restaurant = reviewController.text;
              });
            },
          ),
          StarRating(
            starCount: 10,
            onRatingChanged: (rating) {
              setState(() {
                this._rating = rating;
              });
            },
          )
        ],
      )),
    );
  }
}
