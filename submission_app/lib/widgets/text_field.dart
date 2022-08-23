import 'package:flutter/material.dart';

Widget textFieldCustom(String hint, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)),
    child: TextField(
      controller: controller,
      obscureText: hint == 'Password' ? true : false,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
    ),
  );
}
