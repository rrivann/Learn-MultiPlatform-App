import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import '../common/result_state.dart';
import 'package:restaurant_app/widgets/card_restaurant_widget.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          SearchRestaurantProvider(apiService: RestaurantApiService()),
      child: Platform.isAndroid
          ? _buildAndroid(context, _searchController)
          : _buildIos(context, _searchController),
    );
  }
}

Widget _buildAndroid(
    BuildContext context, TextEditingController searchController) {
  return Consumer<SearchRestaurantProvider>(builder: (context, value, _) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Restaurant / Foods / Drinks',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onChanged: (value) {
                      Provider.of<SearchRestaurantProvider>(context,
                              listen: false)
                          .onChangeSearch(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _futureBuilder(context))
        ],
      )),
    );
  });
}

Widget _buildIos(BuildContext context, TextEditingController searchController) {
  return Consumer<SearchRestaurantProvider>(builder: (context, value, _) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: const Text('Search'),
            transitionBetweenRoutes: false,
            automaticallyImplyLeading: false,
            leading: Material(
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: primaryColor,
                  )),
            )),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    CupertinoTextField(
                      controller: searchController,
                      placeholder: 'Restaurant / Foods / Drinks',
                      onChanged: (value) {
                        Provider.of<SearchRestaurantProvider>(context,
                                listen: false)
                            .onChangeSearch(value);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: _futureBuilder(context))
            ],
          ),
        ));
  });
}

Widget _futureBuilder(BuildContext context) {
  return Consumer<SearchRestaurantProvider>(
    builder: (context, value, _) {
      if (value.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (value.state == ResultState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.result.restaurants.length,
          itemBuilder: (context, index) {
            var restaurantSearch = value.result.restaurants[index];
            return cardRestaurant(
              context,
              restaurantSearch,
            );
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
