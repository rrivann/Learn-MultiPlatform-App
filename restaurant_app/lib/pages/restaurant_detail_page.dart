import 'dart:io';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/widgets/build_restaurant_detail_widget.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? buildRestaurantDetailAndroidWidget(context, restaurant)
        : buildRestaurantDetailIosWidget(context, restaurant);
  }
}
