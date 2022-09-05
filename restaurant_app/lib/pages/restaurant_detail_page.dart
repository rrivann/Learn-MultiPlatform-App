import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_api.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/provider/new_review_provider.dart';
import 'package:restaurant_app/widgets/restaurant_detail_widget.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';
  final String id;

  const RestaurantDetailPage({Key? key, required this.id}) : super(key: key);

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
              apiService: RestaurantApiService(), id: widget.id),
        ),
        ChangeNotifierProvider(
          create: (context) => NewReviewProvider(
              apiService: RestaurantApiService(), id: widget.id),
        )
      ],
      child: Platform.isAndroid
          ? _buildRestaurantDetailAndroidWidget(
              context, _nameController, _reviewController)
          : _buildRestaurantDetailIosWidget(
              context, _nameController, _reviewController),
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
    TextEditingController reviewController) {
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
                          nameRestaurantAndroidWidget(value),
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
                              context, nameController, reviewController),
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
    TextEditingController reviewController) {
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
                          nameRestaurantIosWidget(value),
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
                              context, nameController, reviewController),
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
              child: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
        ],
      ),
    ),
  );
}
