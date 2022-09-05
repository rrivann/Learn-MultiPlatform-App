import 'dart:convert';

class DetailRestaurant {
  DetailRestaurant({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  RestaurantDetail restaurant;

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) =>
      DetailRestaurant(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetail.fromJson(json["restaurant"]),
      );
}

List<DetailRestaurant> parseDetailRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => DetailRestaurant.fromJson(json)).toList();
}

class RestaurantDetail {
  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<CategoryDetail> categories;
  MenusDetail menus;
  double rating;
  List<CustomerReviewDetail> customerReviews;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<CategoryDetail>.from(
            json["categories"].map((x) => CategoryDetail.fromJson(x))),
        menus: MenusDetail.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<CustomerReviewDetail>.from(json["customerReviews"]
            .map((x) => CustomerReviewDetail.fromJson(x))),
      );
}

class CategoryDetail {
  CategoryDetail({
    required this.name,
  });

  String name;

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
        name: json["name"],
      );
}

class CustomerReviewDetail {
  CustomerReviewDetail({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReviewDetail.fromJson(Map<String, dynamic> json) =>
      CustomerReviewDetail(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
}

class MenusDetail {
  MenusDetail({
    required this.foods,
    required this.drinks,
  });

  List<CategoryDetail> foods;
  List<CategoryDetail> drinks;

  factory MenusDetail.fromJson(Map<String, dynamic> json) => MenusDetail(
        foods: List<CategoryDetail>.from(
            json["foods"].map((x) => CategoryDetail.fromJson(x))),
        drinks: List<CategoryDetail>.from(
            json["drinks"].map((x) => CategoryDetail.fromJson(x))),
      );
}
