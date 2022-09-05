import 'package:flutter/material.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/data/models/search_restaurant.dart';
import 'package:restaurant_app/utils/nointernet_exception.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  SearchRestaurantProvider({required this.apiService}) {
    _fetchSearchRestaurant();
  }

  final RestaurantApiService apiService;
  String query = '';
  late ResultState _state;
  late SearchRestaurant _searchRestaurant;
  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  SearchRestaurant get result => _searchRestaurant;

  void onChangeSearch(String searchString) {
    query = searchString;
    _fetchSearchRestaurant();
    notifyListeners();
  }

  Future<dynamic> _fetchSearchRestaurant() async {
    try {
      if (query.isNotEmpty) {
        _state = ResultState.loading;
        notifyListeners();
        final searchRestaurant = await apiService.searchRestaurant(query);
        if (searchRestaurant.restaurants.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'Empty Data';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          return _searchRestaurant = searchRestaurant;
        }
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Finding restaurant for you';
      }
    } on NoInternetException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }
}
