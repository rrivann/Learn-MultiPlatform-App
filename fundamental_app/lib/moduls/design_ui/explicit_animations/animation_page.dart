import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _iconController;
  bool _isRotating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _iconController.dispose();
    super.dispose();
  }

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
            RotationTransition(
              turns: _controller,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const FlutterLogo(
                  size: 100,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (_isRotating) {
                  _controller.stop();
                  _iconController.reverse();
                } else {
                  _controller.repeat();
                  _iconController.forward();
                }
                _isRotating = !_isRotating;
              },
              icon: AnimatedIcon(
                  icon: AnimatedIcons.play_pause, progress: _iconController),
            ),
          ],
        ),
      ),
    );
  }
}
