import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatefulWidget {
  const GestureDetectorScreen({Key? key}) : super(key: key);

  @override
  State<GestureDetectorScreen> createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  final double boxSize = 150.0;

  int numTaps = 0;
  int numDoubleTaps = 0;
  int numLongPress = 0;

  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Gesture Detector'),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              // onVerticalDragUpdate: (DragUpdateDetails details) => setState(
              //   () {
              //     double delta = details.delta.dy;
              //     posY += delta;
              //   },
              // ),
              // onHorizontalDragUpdate: (DragUpdateDetails details) => setState(
              //   () {
              //     double delta = details.delta.dx;
              //     posX += delta;
              //   },
              // ),
              onPanUpdate: (details) => setState(() {
                double deltaX = details.delta.dx;
                double deltaY = details.delta.dy;
                posX += deltaX;
                posY += deltaY;
              }),
              onTap: () => setState(() => numTaps++),
              onDoubleTap: () => setState(() => numDoubleTaps++),
              onLongPress: () => setState(() => numLongPress++),
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: const BoxDecoration(color: Colors.red),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16),
        child: Text(
          'Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $numLongPress',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      posX = posX;
      posY = posY;
    });
  }
}
