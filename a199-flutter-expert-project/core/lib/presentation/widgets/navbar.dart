import 'package:core/core.dart';
import 'package:core/presentation/pages/movie/home_movie_page.dart';
import 'package:core/presentation/pages/tv_series/home_tv_series_page.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/bottomNav';
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: kMikadoYellow,
        currentIndex: bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) => setState(() => bottomNavIndex = selected),
      ),
    );
  }
}

final List<BottomNavigationBarItem> _bottomNavBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.movie),
    label: 'Movie',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.movie_filter),
    label: 'Tv-Series',
  ),
];

final List<Widget> _listWidget = [
  const HomeMoviePage(),
  const HomeTvSeriesPage(),
];
