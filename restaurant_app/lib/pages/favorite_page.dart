import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/provider/favorite_provider.dart';
import '../common/result_state.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';
import 'package:restaurant_app/widgets/card_restaurant_widget.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = 'favorite';
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlatformWidget(
      androidBuilder: _buildAndroidWidget,
      iosBuilder: _buildIosWidget,
    );
  }
}

Widget _buildAndroidWidget(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Restaurant App'),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, SearchPage.routeName),
          icon: const Icon(Icons.search),
        ),
      ],
    ),
    body: SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorite Restaurant',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your favorite restaurant !',
                  style: TextStyle(color: CupertinoColors.systemGrey),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: _futureBuilder(context)),
      ],
    )),
  );
}

Widget _buildIosWidget(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: const Text('Restaurant App'),
      transitionBetweenRoutes: false,
      automaticallyImplyLeading: false,
      trailing: Material(
        child: IconButton(
          onPressed: () => Navigator.pushNamed(context, SearchPage.routeName),
          icon: const Icon(
            Icons.search,
            color: primaryColor,
          ),
        ),
      ),
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
  return Consumer<FavoriteProvider>(
    builder: (context, provider, _) {
      if (provider.resultState == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (provider.resultState == ResultState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: provider.favorites.length,
          itemBuilder: (context, index) {
            var restaurantList = provider.favorites[index];
            return cardRestaurantFavorite(
                context, restaurantList, restaurantList.id);
          },
        );
      } else if (provider.resultState == ResultState.noData) {
        return Center(
          child: Material(
            child: Text(provider.message),
          ),
        );
      } else if (provider.resultState == ResultState.error) {
        return Center(
          child: Material(
            child: Text(provider.message),
          ),
        );
      } else {
        return const Center(
          child: Material(
            child: Text(''),
          ),
        );
      }
    },
  );
}
