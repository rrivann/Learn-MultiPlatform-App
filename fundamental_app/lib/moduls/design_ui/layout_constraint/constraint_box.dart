import 'package:flutter/material.dart';

class ConstraintBox extends StatelessWidget {
  const ConstraintBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: ConstrainedBox(
    //     constraints: const BoxConstraints(
    //       minWidth: 70,
    //       minHeight: 70,
    //       maxWidth: 150,
    //       maxHeight: 150,
    //     ),
    //     child: Container(
    //       color: Colors.red,
    //     ),
    //   ),
    // );
    // return UnconstrainedBox(
    //   child: Container(
    //     color: Colors.red,
    //     width: 1000,
    //     height: 100,
    //   ),
    // );
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.red,
            child: const Text('Hello!'),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.green,
            child: const Text('Goodbye!'),
          ),
        ),
      ],
    );
  }
}
