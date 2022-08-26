import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/desain_ui/explicit_animations/animation_page.dart';

class MainExplicitAnimation extends StatelessWidget {
  const MainExplicitAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationPage(),
    );
  }
}
