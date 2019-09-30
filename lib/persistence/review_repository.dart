import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasted/models/review.dart';

class ReviewRepository {
  Future<List<Review>> allReviews() async {
    Future<List> futureReviewSnapshots =
        Firestore.instance.collection('reviews').snapshots().toList();
    var reviewSnapshots = await futureReviewSnapshots;
    return reviewSnapshots.map(reviewDeserializer);
  }

  Review reviewDeserializer(snapshot) {
    log('Parsing $snapshot');
    return Review(snapshot.data['restaurant'], snapshot.data['reviewedBy'],
        snapshot.data['rating']);
  }
}
