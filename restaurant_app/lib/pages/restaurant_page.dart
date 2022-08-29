import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/build_restaurant_widget.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformWidget(
      androidBuilder: buildRestaurantAndroidWidget,
      iosBuilder: buildRestaurantIosWidget,
    );
  }
}
