import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/common/navigation.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/models/article_api_model.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/article_detail_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/article_web_view.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/home_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/common/styles.dart';

class MainNewsApp extends StatelessWidget {
  const MainNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as ArticleApi),
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
