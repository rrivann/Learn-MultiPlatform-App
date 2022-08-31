// import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  // final bool _isBig = false;
  final double _size = 100;
  // final Tween<double> _animationTween = Tween(begin: 0, end: pi * 2);
  final ColorTween _colorTween =
      ColorTween(begin: Colors.blue, end: Colors.purple);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer(
            //   duration: const Duration(seconds: 1),
            //   color: Colors.blue,
            //   height: _size,
            //   width: _size,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       _size = _isBig ? 200 : 100;
            //       _isBig = !_isBig;
            //     });
            //   },
            //   child: const Text('Animate'),
            // ),
            // TweenAnimationBuilder<double>(
            //   tween: _animationTween,
            //   duration: const Duration(seconds: 3),
            //   builder: (context, double value, child) => Transform.rotate(
            //     angle: value,
            //     child: Container(
            //       color: Colors.blue,
            //       height: _size,
            //       width: _size,
            //     ),
            //   ),
            // ),
            TweenAnimationBuilder<Color?>(
              tween: _colorTween,
              duration: const Duration(seconds: 3),
              builder: (context, Color? value, child) {
                return Container(
                  color: value,
                  height: _size,
                  width: _size,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
