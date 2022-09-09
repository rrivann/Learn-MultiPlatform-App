import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/provider/new_review_provider.dart';
import '../common/result_state.dart';
import 'package:restaurant_app/widgets/restaurant_detail_widget.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';
  final dynamic restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DetailRestaurantProvider(
              apiService: RestaurantApiService(), id: widget.restaurant.id),
        ),
        ChangeNotifierProvider(
          create: (context) => NewReviewProvider(
              apiService: RestaurantApiService(), id: widget.restaurant.id),
        )
      ],
      child: Platform.isAndroid
          ? _buildRestaurantDetailAndroidWidget(
              context, _nameController, _reviewController, widget.restaurant)
          : _buildRestaurantDetailIosWidget(
              context, _nameController, _reviewController, widget.restaurant),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }
}

Widget _buildRestaurantDetailAndroidWidget(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController reviewController,
    dynamic restaurant) {
  return Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Consumer<DetailRestaurantProvider>(builder: (context, value, child) {
            if (value.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (value.state == ResultState.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    heroWidget(urlImageMedium, value),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          nameRestaurantWidget(value, restaurant),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey),
                          descriptionWidget(value),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 10),
                          menusWidget(value),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 10),
                          reviewAndroidWidget(
                              context, nameController, reviewController, value),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
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
          }),
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

Widget _buildRestaurantDetailIosWidget(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController reviewController,
    dynamic restaurant) {
  return CupertinoPageScaffold(
    child: SafeArea(
      child: Stack(
        children: [
          Consumer<DetailRestaurantProvider>(builder: (context, value, child) {
            if (value.state == ResultState.loading) {
              return const Center(
                  child: Material(child: CircularProgressIndicator()));
            } else if (value.state == ResultState.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    heroWidget(urlImageMedium, value),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          nameRestaurantWidget(value, restaurant),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey),
                          descriptionWidget(value),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 10),
                          menusWidget(value),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 10),
                          reviewIosWidget(
                              context, nameController, reviewController, value),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
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
          }),
          CupertinoButton(
              child: const Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
              onPressed: () => Navigator.pop(context)),
        ],
      ),
    ),
  );
}
