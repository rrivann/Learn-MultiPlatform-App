import 'package:flutter/material.dart';

class ConstraintScreen extends StatelessWidget {
  const ConstraintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(15),
        child: Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
