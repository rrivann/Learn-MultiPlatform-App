import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/design_ui/implicit_animations/animation_page.dart';

class MainImplicitAnimation extends StatelessWidget {
  const MainImplicitAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationPage(),
    );
  }
}
