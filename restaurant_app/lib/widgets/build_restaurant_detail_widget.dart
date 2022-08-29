import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/utils/styles.dart';
import 'package:restaurant_app/widgets/menus_name_widget.dart';

Widget buildRestaurantDetailAndroidWidget(
    BuildContext context, Restaurant restaurant) {
  return Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(restaurant.pictureId),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(CupertinoIcons.location),
                          const SizedBox(width: 5),
                          Text(restaurant.city),
                          const SizedBox(width: 15),
                          const Icon(CupertinoIcons.star_fill),
                          const SizedBox(width: 5),
                          Text(restaurant.rating.toString()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        restaurant.description,
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),
                      const Text(
                        'Menus',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text('Foods: '),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return menusNameWidget(restaurant
                                        .menus.foods[index].name
                                        .toString());
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 10);
                                  },
                                  itemCount: restaurant.menus.foods.length),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text('Drinks: '),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return menusNameWidget(restaurant
                                        .menus.drinks[index].name
                                        .toString());
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 10);
                                  },
                                  itemCount: restaurant.menus.drinks.length),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: primaryColor,
              ))
        ],
      ),
    ),
  );
}

Widget buildRestaurantDetailIosWidget(
    BuildContext context, Restaurant restaurant) {
  return CupertinoPageScaffold(
    child: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: restaurant.pictureId,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.network(restaurant.pictureId)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(CupertinoIcons.location),
                          const SizedBox(width: 5),
                          Text(restaurant.city),
                          const SizedBox(width: 15),
                          const Icon(CupertinoIcons.star_fill),
                          const SizedBox(width: 5),
                          Text(restaurant.rating.toString()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        restaurant.description,
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),
                      const Text(
                        'Menus',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text('Foods: '),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return menusNameWidget(restaurant
                                        .menus.foods[index].name
                                        .toString());
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 10);
                                  },
                                  itemCount: restaurant.menus.foods.length),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text('Drinks: '),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return menusNameWidget(restaurant
                                        .menus.drinks[index].name
                                        .toString());
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 10);
                                  },
                                  itemCount: restaurant.menus.drinks.length),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
          CupertinoButton(
              child: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
        ],
      ),
    ),
  );
}
