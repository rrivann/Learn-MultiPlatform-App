import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/common/styles.dart';

class SplashScreenAndroidPage extends StatefulWidget {
  static const routeName = '/splash_screen_android_page';

  const SplashScreenAndroidPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenAndroidPage> createState() =>
      _SplashScreenAndroidPageState();
}

class _SplashScreenAndroidPageState extends State<SplashScreenAndroidPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, HomePage.routeName),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.house,
              size: 100,
              color: primaryColor,
            ),
            const SizedBox(height: 10),
            Text(
              'Restaurant App',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

class SplashScreenIosPage extends StatefulWidget {
  static const routeName = '/splash_screen_ios_page';

  const SplashScreenIosPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenIosPage> createState() => _SplashScreenIosPageState();
}

class _SplashScreenIosPageState extends State<SplashScreenIosPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, HomePage.routeName),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              CupertinoIcons.house_fill,
              size: 100,
            ),
            Text(
              'Restaurant App',
              style: TextStyle(color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
