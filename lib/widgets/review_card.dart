import 'package:flutter/material.dart';
import 'package:tasted/models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  ReviewCard(this.review);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text(this.review.dish.toString()),
            subtitle: Text(this.review.reviewedBy.toString() +
                ' at ' +
                this.review.restaurant.name),
          ),
        ],
      ),
    );
  }
}
