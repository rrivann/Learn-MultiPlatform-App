import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/provider/list_restaurant_provider.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';
import 'package:restaurant_app/widgets/restaurant_item_widget.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ListRestaurantProvider(apiService: RestaurantApiService()),
      child: const PlatformWidget(
        androidBuilder: _buildRestaurantAndroidWidget,
        iosBuilder: _buildRestaurantIosWidget,
      ),
    );
  }
}

Widget _buildRestaurantAndroidWidget(BuildContext context) {
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

Widget _buildRestaurantIosWidget(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: const Text('Restaurant App'),
      transitionBetweenRoutes: false,
      automaticallyImplyLeading: false,
      trailing: Material(
        child: IconButton(
          onPressed: () => Navigator.pushNamed(context, SearchPage.routeName),
          icon: const Icon(Icons.search),
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
  return Consumer<ListRestaurantProvider>(
    builder: (context, value, _) {
      if (value.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (value.state == ResultState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.result.restaurants.length,
          itemBuilder: (context, index) {
            var restaurantList = value.result.restaurants[index];
            return restaurantItemWidget(
                context, restaurantList, restaurantList.id);
          },
        );
      } else if (value.state == ResultState.noData) {
        return Center(
          child: Material(
            child: Text(value.message),
          ),
        );
      } else if (value.state == ResultState.error) {
        return Center(
          child: Material(
            child: Text(value.message),
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
