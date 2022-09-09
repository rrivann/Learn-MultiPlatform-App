import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/common/nointernet_exception.dart';
import '../common/result_state.dart';

class ListRestaurantProvider extends ChangeNotifier {
  ListRestaurantProvider({required this.apiService}) {
    _fetchListRestaurant();
  }

  final RestaurantApiService apiService;
  late ResultState _state;
  late ListRestaurant _listRestaurant;
  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  ListRestaurant get result => _listRestaurant;

  Future<dynamic> _fetchListRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listRestaurant = await apiService.listRestaurant();
      if (listRestaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _listRestaurant = listRestaurant;
      }
    } on NoInternetException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    } catch (e) {
      _state = ResultState.error;
      return _message = 'Error: $e';
    }
  }
}
