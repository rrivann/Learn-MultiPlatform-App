import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';

Widget restaurantItemWidget(BuildContext context, restaurant, String id) {
  return Material(
    child: ListTile(
      onTap: () => {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: id)
      },
      tileColor: Colors.white,
      leading: Hero(
        tag: urlImageMedium + restaurant.pictureId,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(45),
              child: Image.network(
                urlImageMedium + restaurant.pictureId,
                width: 100,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
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
  );
}
