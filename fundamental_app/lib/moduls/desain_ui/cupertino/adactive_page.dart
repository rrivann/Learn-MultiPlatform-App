import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdactivePage extends StatefulWidget {
  const AdactivePage({Key? key}) : super(key: key);

  @override
  State<AdactivePage> createState() => _AdactivePageState();
}

class _AdactivePageState extends State<AdactivePage> {
  bool _isSelected = true;
  double _sliderValue = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch.adaptive(
              value: _isSelected,
              onChanged: (value) {
                setState(() {
                  _isSelected = value;
                });
              },
            ),
            Slider.adaptive(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            defaultTargetPlatform == TargetPlatform.iOS
                ? const Text('iOS')
                : const Text('Android'),
          ],
        ),
      ),
    );
  }
}
