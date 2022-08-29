import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/widgets/restaurant_item_widget.dart';

Widget buildRestaurantAndroidWidget(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Restaurant App'),
      automaticallyImplyLeading: false,
    ),
    body: SafeArea(
        child: Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Restaurant',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recomendation restaurant for you!',
                    style: TextStyle(color: CupertinoColors.systemGrey),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: _futureBuilder(context)),
      ],
    )),
  );
}

Widget buildRestaurantIosWidget(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Restaurant App'),
      transitionBetweenRoutes: false,
      automaticallyImplyLeading: false,
    ),
    child: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Restaurant',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recomendation restaurant for you!',
                    style: TextStyle(color: CupertinoColors.systemGrey),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _futureBuilder(context)),
        ],
      ),
    ),
  );
}

Widget _futureBuilder(BuildContext context) {
  return FutureBuilder<String>(
    future: DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json'),
    builder: (context, snapshot) {
      final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
      if (restaurants.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return restaurantItemWidget(context, restaurants[index]);
          },
          itemCount: restaurants.length,
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error !!',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Data is empty',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        );
      }
    },
  );
}
