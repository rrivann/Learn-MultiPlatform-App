import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/data/models/detail_restaurant.dart';
import 'package:restaurant_app/common/nointernet_exception.dart';
import '../common/result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _fetchDetailRestaurant();
  }

  final RestaurantApiService apiService;
  final String id;

  late ResultState _state;
  late DetailRestaurant _detailRestaurant;
  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  DetailRestaurant get result => _detailRestaurant;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detailRestaurant = await apiService.detailRestaurant(id);
      if (detailRestaurant.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailRestaurant = detailRestaurant;
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
