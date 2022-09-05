import 'dart:convert';

class SearchRestaurant {
  SearchRestaurant({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<RestaurantSearch> restaurants;

  factory SearchRestaurant.fromJson(Map<String, dynamic> json) =>
      SearchRestaurant(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantSearch>.from(
            json["restaurants"].map((x) => RestaurantSearch.fromJson(x))),
      );
}

List<SearchRestaurant> parseSearchRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => SearchRestaurant.fromJson(json)).toList();
}

class RestaurantSearch {
  RestaurantSearch({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) =>
      RestaurantSearch(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );
}
