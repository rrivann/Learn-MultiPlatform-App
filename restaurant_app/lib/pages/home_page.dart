import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/pages/restaurant_page.dart';
import 'package:restaurant_app/pages/setting_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? _buildHomeAndroidWidget(
            bottomNavIndex,
            (selected) => setState(() => bottomNavIndex = selected),
          )
        : _buildHomeIosWidget(context);
  }
}

Widget _buildHomeAndroidWidget(int bottomNavIndex, Function(int) onTap) {
  return Scaffold(
    body: _listWidget[bottomNavIndex],
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: primaryColor,
      currentIndex: bottomNavIndex,
      items: _bottomNavBarItems,
      onTap: onTap,
    ),
  );
}

Widget _buildHomeIosWidget(BuildContext context) {
  return CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
      activeColor: primaryColor,
      items: _bottomNavBarItems,
    ),
    tabBuilder: (context, index) => _listWidget[index],
  );
}

final List<BottomNavigationBarItem> _bottomNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Platform.isIOS ? CupertinoIcons.house_fill : Icons.house),
    label: 'Restaurant',
  ),
  BottomNavigationBarItem(
    icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
    label: 'Setting',
  ),
];

final List<Widget> _listWidget = [
  const RestaurantPage(),
  const SettingPage(),
];
