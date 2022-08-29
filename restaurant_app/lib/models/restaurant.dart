import 'dart:convert';

import 'package:restaurant_app/models/menus.dart';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
        id: restaurant['id'],
        name: restaurant['name'],
        description: restaurant['description'],
        pictureId: restaurant['pictureId'],
        city: restaurant['city'],
        rating: restaurant['rating'].toDouble(),
        menus: Menus.fromJson(restaurant['menus']),
      );
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
