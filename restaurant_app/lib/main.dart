import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/build_main_widget.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformWidget(
      androidBuilder: buildMainAndroidWidget,
      iosBuilder: buildMainIosWidget,
    );
  }
}
