import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

Widget menusNameWidget(String menus) {
  return Container(
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(10),
    child: Text(menus),
  );
}
