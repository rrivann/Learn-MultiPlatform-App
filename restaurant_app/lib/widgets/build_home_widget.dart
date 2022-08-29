import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/restaurant_page.dart';
import 'package:restaurant_app/pages/setting_page.dart';
import 'package:restaurant_app/utils/styles.dart';

class BuildHomeAndroidWidget extends StatefulWidget {
  const BuildHomeAndroidWidget({Key? key}) : super(key: key);

  @override
  State<BuildHomeAndroidWidget> createState() => _BuildHomeAndroidWidgetState();
}

class _BuildHomeAndroidWidgetState extends State<BuildHomeAndroidWidget> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        currentIndex: bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) => setState(() {
          bottomNavIndex = selected;
        }),
      ),
    );
  }
}

Widget buildHomeIosWidget(BuildContext context) {
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
