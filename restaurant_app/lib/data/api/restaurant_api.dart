import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/detail_restaurant.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/data/models/new_review.dart';
import 'package:restaurant_app/data/models/search_restaurant.dart';
import 'package:restaurant_app/common/nointernet_exception.dart';

const String urlImageMedium =
    'https://restaurant-api.dicoding.dev/images/medium/';

class RestaurantApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<ListRestaurant> listRestaurant() async {
    try {
      final response = await http.get(Uri.parse("${_baseUrl}list"));
      if (response.statusCode == 200) {
        return ListRestaurant.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load list restaurant');
      }
    } on Exception catch (_) {
      throw NoInternetException();
    }
  }

  Future<DetailRestaurant> detailRestaurant(String id) async {
    try {
      final response = await http.get(Uri.parse("${_baseUrl}detail/$id"));
      if (response.statusCode == 200) {
        return DetailRestaurant.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load detail restaurant');
      }
    } on Exception catch (_) {
      throw NoInternetException();
    }
  }

  Future<SearchRestaurant> searchRestaurant(String query) async {
    try {
      final response = await http.get(Uri.parse("${_baseUrl}search?q=$query"));
      if (response.statusCode == 200) {
        return SearchRestaurant.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load search restaurant');
      }
    } on Exception catch (_) {
      throw NoInternetException();
    }
  }

  Future<NewReview> newReview(String id, String name, String review) async {
    try {
      final response = await http.post(
        Uri.parse("${_baseUrl}review"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {"id": id, "name": name, "review": review},
      );
      if (response.statusCode == 201) {
        return NewReview.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load new review');
      }
    } on Exception catch (_) {
      throw NoInternetException();
    }
  }
}
