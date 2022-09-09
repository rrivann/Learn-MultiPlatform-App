import 'package:flutter/material.dart';
import 'package:restaurant_app/data/db/favorite_helper.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import '../common/result_state.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoriteHelper favoriteHelperDb;

  FavoriteProvider({required this.favoriteHelperDb}) {
    _getFavorites();
  }

  ResultState _resultState = ResultState.loading;
  ResultState get resultState => _resultState;

  String _message = '';
  String get message => _message;

  List<RestaurantList> _favorites = [];
  List<RestaurantList> get favorites => _favorites;

  void _getFavorites() async {
    _favorites = await favoriteHelperDb.getFavorites();
    if (_favorites.isNotEmpty) {
      _resultState = ResultState.hasData;
    } else {
      _resultState = ResultState.noData;
      _message = 'Empty Data Favorite';
    }
    notifyListeners();
  }

  void addFavorite(restaurant) async {
    try {
      await favoriteHelperDb.insertFavorite(restaurant);
      _getFavorites();
    } catch (e) {
      _resultState = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    final favoriteRestaurant = await favoriteHelperDb.getFavoriteById(id);
    return favoriteRestaurant.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await favoriteHelperDb.removeFavorite(id);
      _getFavorites();
    } catch (e) {
      _resultState = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
