import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/build_setting_widget.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformWidget(
      androidBuilder: buildSettingAndroidWidget,
      iosBuilder: buildSettingIosWidget,
    );
  }
}
