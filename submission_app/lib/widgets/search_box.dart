import 'package:flutter/material.dart';

Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: Icon(
          Icons.search,
          size: 20,
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
        hintText: 'Search',
      ),
    ),
  );
}
