import 'package:tasted/models/restaurant.dart';
import 'package:tasted/models/user.dart';

class Review {
  Review(this._restaurant, this._reviewedBy, this._rating);

  Restaurant _restaurant;
  double _rating;
  User _reviewedBy;

  User get reviewedBy => _reviewedBy;
  Restaurant get restaurant => _restaurant;
  double get rating => _rating;
}
