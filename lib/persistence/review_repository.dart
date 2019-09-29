import 'package:tasted/models/dish.dart';
import 'package:tasted/models/restaurant.dart';
import 'package:tasted/models/review.dart';
import 'package:tasted/models/user.dart';

class ReviewRepository {
  List<Review> get allReviews {
    return [
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
      Review(Restaurant('Emily\'s'), User('Marcus', 'Nordberg'), 5.0,
          Dish('Double Stacked Burger')),
    ];
  }
}
