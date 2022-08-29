import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';

Widget restaurantItemWidget(BuildContext context, Restaurant restaurant) {
  return Material(
    child: InkWell(
      onTap: () => {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant)
      },
      child: ListTile(
        tileColor: Colors.white,
        leading: Hero(
          tag: restaurant.pictureId,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(45),
                child: Image.network(
                  restaurant.pictureId,
                  width: 100,
                ),
              )),
        ),
        title: Text(restaurant.name),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.location,
                    size: 15,
                  ),
                  const SizedBox(width: 10),
                  Text(restaurant.city),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.star,
                    size: 15,
                  ),
                  const SizedBox(width: 10),
                  Text(restaurant.rating.toString()),
                ],
              ),
            ],
          ),
        ),
        isThreeLine: true,
      ),
    ),
  );
}
