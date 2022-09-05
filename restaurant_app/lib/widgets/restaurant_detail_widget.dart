import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/new_review_provider.dart';
import 'package:restaurant_app/widgets/menus_name_widget.dart';

Widget heroWidget(urlImageMedium, value) {
  return Hero(
    tag: urlImageMedium + value.result.restaurant.pictureId,
    child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
        child: Image.network(
          urlImageMedium + value.result.restaurant.pictureId,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        )),
  );
}

Widget nameRestaurantAndroidWidget(value) {
  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Text(
      value.result.restaurant.name,
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
        Text(value.result.restaurant.city),
        const SizedBox(width: 15),
        const Icon(CupertinoIcons.star),
        const SizedBox(width: 5),
        Text(value.result.restaurant.rating.toString()),
      ],
    ),
  ]);
}

Widget nameRestaurantIosWidget(value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        value.result.restaurant.name,
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
          Text(value.result.restaurant.city),
          const SizedBox(width: 15),
          const Icon(CupertinoIcons.star),
          const SizedBox(width: 5),
          Text(value.result.restaurant.rating.toString()),
        ],
      ),
    ],
  );
}

Widget descriptionWidget(value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        'Description',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      Text(
        value.result.restaurant.description,
      ),
    ],
  );
}

Widget menusWidget(value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
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
                    return menusNameWidget(value
                        .result.restaurant.menus.foods[index].name
                        .toString());
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemCount: value.result.restaurant.menus.foods.length),
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
                    return menusNameWidget(value
                        .result.restaurant.menus.drinks[index].name
                        .toString());
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemCount: value.result.restaurant.menus.drinks.length),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget reviewAndroidWidget(context, nameController, reviewController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        'Review',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Your Name',
              contentPadding: EdgeInsets.symmetric(horizontal: 10)),
          controller: nameController,
          onChanged: (value) =>
              Provider.of<NewReviewProvider>(context, listen: false)
                  .onChangeName(value),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Your Review',
              contentPadding: EdgeInsets.symmetric(horizontal: 10)),
          controller: reviewController,
          onChanged: (value) =>
              Provider.of<NewReviewProvider>(context, listen: false)
                  .onChangeReview(value),
        ),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () async {
          var result =
              await Provider.of<NewReviewProvider>(context, listen: false)
                  .fetchNewReview();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(result.message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
          nameController.clear();
          reviewController.clear();
        },
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(color: primaryColor)),
        child:
            Provider.of<NewReviewProvider>(context).state == ResultState.loading
                ? Center(
                    child: Material(
                        child: Container(
                            color: primaryColor,
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.all(0),
                            child: const CircularProgressIndicator())))
                : const Text(
                    'Add New Review',
                    style: TextStyle(color: Colors.black),
                  ),
      ),
    ],
  );
}

Widget reviewIosWidget(context, nameController, reviewController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        'Review',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      CupertinoTextField(
        placeholder: 'Your Name',
        controller: nameController,
        onChanged: (value) =>
            Provider.of<NewReviewProvider>(context, listen: false)
                .onChangeName(value),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 150,
        child: CupertinoTextField(
          placeholder: 'Your Review',
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: reviewController,
          onChanged: (value) =>
              Provider.of<NewReviewProvider>(context, listen: false)
                  .onChangeReview(value),
        ),
      ),
      const SizedBox(height: 15),
      Material(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, padding: const EdgeInsets.all(20)),
          onPressed: () async {
            var result =
                await Provider.of<NewReviewProvider>(context, listen: false)
                    .fetchNewReview();
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text(result.message),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
            nameController.clear();
            reviewController.clear();
          },
          child: Provider.of<NewReviewProvider>(context).state ==
                  ResultState.loading
              ? Center(
                  child: Material(
                      child: Container(
                          color: primaryColor,
                          padding: const EdgeInsets.all(0),
                          margin: const EdgeInsets.all(0),
                          child: const CircularProgressIndicator())))
              : const Text(
                  'Add New Review',
                  style: TextStyle(color: Colors.black),
                ),
        ),
      ),
    ],
  );
}
