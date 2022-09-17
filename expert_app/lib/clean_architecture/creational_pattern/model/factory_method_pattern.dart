import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeHandphone { nexus5, nexus9 }

abstract class Handphone {
  late String processor;
  late String battery;
  late String screenSize;

  factory Handphone(TypeHandphone type) {
    switch (type) {
      case TypeHandphone.nexus5:
        return HandphoneNexus5();
      case TypeHandphone.nexus9:
        return HandphoneNexus9();
    }
  }
}

class HandphoneNexus5 implements Handphone {
  @override
  String processor = 'Snapdragon';

  @override
  String battery = '2300 mAh';

  @override
  String screenSize = '4.95 inch';
}

class HandphoneNexus9 implements Handphone {
  @override
  String processor = 'Nvidia Tegra';

  @override
  String battery = '6700 mAh';

  @override
  String screenSize = '8.9 inch';
}

abstract class PlatformButton {
  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidButton();
      case TargetPlatform.iOS:
        return IosButton();
      default:
        return AndroidButton();
    }
  }

  Widget build({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
  });
}

class AndroidButton implements PlatformButton {
  @override
  Widget build({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class IosButton implements PlatformButton {
  @override
  Widget build({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(onPressed: onPressed, child: child);
  }
}
