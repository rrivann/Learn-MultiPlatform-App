import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/pages/splash_screen_android_page.dart';
import 'package:restaurant_app/pages/splash_screen_ios_page.dart';
import 'package:restaurant_app/utils/styles.dart';

Widget buildMainAndroidWidget(BuildContext context) {
  return MaterialApp(
    title: 'Restaurant App',
    theme: ThemeData(
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: primaryColor,
            secondary: secondaryColor,
            onPrimary: Colors.black,
          ),
      textTheme: myTextTheme,
      appBarTheme: const AppBarTheme(elevation: 0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: secondaryColor,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: SplashScreenAndroidPage.routeName,
    routes: {
      SplashScreenAndroidPage.routeName: (context) =>
          const SplashScreenAndroidPage(),
      HomePage.routeName: (context) => const HomePage(),
      RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
    },
  );
}

Widget buildMainIosWidget(BuildContext context) {
  return CupertinoApp(
    title: 'Restaurant App',
    theme: CupertinoThemeData(
      primaryColor: primaryColor,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: CupertinoColors.black,
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: SplashScreenIosPage.routeName,
    routes: {
      SplashScreenIosPage.routeName: (context) => const SplashScreenIosPage(),
      HomePage.routeName: (context) => const HomePage(),
      RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
    },
    home: const SplashScreenIosPage(),
  );
}
