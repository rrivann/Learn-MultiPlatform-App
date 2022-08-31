import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/api/api_service.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/headline_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/settings_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/provider/news_provider.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/utils/styles.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/article_list';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    int bottomNavIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: secondaryColor,
        items: _bottomNavBarItems,
      ),
      tabBuilder: (context, index) => _listWidget[index],
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: 'Headline',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: 'Settings',
    ),
  ];

  final List<Widget> _listWidget = [
    ChangeNotifierProvider<NewsProvider>(
        create: (_) => NewsProvider(apiService: ApiService()),
        child: const HeadlinePage()),
    const SettingsPage(),
  ];
}
