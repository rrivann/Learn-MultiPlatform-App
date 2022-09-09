import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/provider/favorite_provider.dart';

Widget cardRestaurant(BuildContext context, restaurant) {
  return Material(
    child: ListTile(
      onTap: () => {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant)
      },
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
                  Icons.location_on,
                  size: 15,
                  color: primaryColor,
                ),
                const SizedBox(width: 10),
                Text(restaurant.city),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 15,
                  color: primaryColor,
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

Widget cardRestaurantFavorite(BuildContext context, restaurant, String id) {
  return Consumer<FavoriteProvider>(
    builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isFavorite(id),
        builder: (context, snapshot) {
          var isFavorite = snapshot.data ?? false;
          return Material(
            child: ListTile(
              onTap: () => {
                Navigator.pushNamed(context, RestaurantDetailPage.routeName,
                    arguments: restaurant)
              },
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
                          return const Center(
                              child: CircularProgressIndicator());
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
                          Icons.location_on,
                          size: 15,
                          color: primaryColor,
                        ),
                        const SizedBox(width: 10),
                        Text(restaurant.city),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: primaryColor,
                        ),
                        const SizedBox(width: 10),
                        Text(restaurant.rating.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              isThreeLine: true,
              trailing: isFavorite
                  ? IconButton(
                      icon: const Icon(Icons.favorite),
                      color: primaryColor,
                      onPressed: () => provider.removeFavorite(id),
                    )
                  : IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: primaryColor,
                      onPressed: () => provider.addFavorite(restaurant),
                    ),
            ),
          );
        },
      );
    },
  );
}
