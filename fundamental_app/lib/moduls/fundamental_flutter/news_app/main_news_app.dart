import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/common/navigation.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/api/api_service.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/db/database_helper.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/models/article_api_model.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/preferences/preferences_helper.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/article_detail_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/article_web_view.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/home_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/provider/database_provider.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/provider/news_provider.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/provider/preferences_provider.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/provider/scheduling_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainNewsApp extends StatelessWidget {
  const MainNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => SchedulingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
              preferencesHelper: PreferencesHelper(
                  sharedPreferences: SharedPreferences.getInstance())),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        )
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'News App',
            theme: provider.themeData,
            builder: (context, child) => CupertinoTheme(
              data: CupertinoThemeData(
                  brightness: provider.isDarkTheme
                      ? Brightness.dark
                      : Brightness.light),
              child: Material(
                child: child,
              ),
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: HomePage.routeName,
            routes: {
              HomePage.routeName: (context) => const HomePage(),
              ArticleDetailPage.routeName: (context) => ArticleDetailPage(
                  article:
                      ModalRoute.of(context)?.settings.arguments as ArticleApi),
              ArticleWebView.routeName: (context) => ArticleWebView(
                  url: ModalRoute.of(context)?.settings.arguments as String)
            },
          );
        },
      ),
    );
  }
}
