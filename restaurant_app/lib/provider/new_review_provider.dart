import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/data/models/new_review.dart';
import 'package:restaurant_app/common/nointernet_exception.dart';
import '../common/result_state.dart';

class NewReviewProvider extends ChangeNotifier {
  NewReviewProvider({required this.apiService, required this.id});

  final RestaurantApiService apiService;
  final String id;
  String? name;
  String? review;

  ResultState _state = ResultState.noData;
  late NewReview _newReview;
  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  NewReview get result => _newReview;

  void onChangeName(String changeName) {
    name = changeName;
    notifyListeners();
  }

  void onChangeReview(String changeReview) {
    review = changeReview;
    notifyListeners();
  }

  Future<dynamic> fetchNewReview() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final newReview = await apiService.newReview(id, name!, review!);
      if (newReview.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _newReview = newReview;
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
