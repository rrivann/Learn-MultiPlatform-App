import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/pages/splash_screen_page.dart';
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
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
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
          id: ModalRoute.of(context)?.settings.arguments as String),
      SearchPage.routeName: (context) => const SearchPage()
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
          id: ModalRoute.of(context)?.settings.arguments as String),
      SearchPage.routeName: (context) => const SearchPage()
    },
    home: const SplashScreenIosPage(),
  );
}
