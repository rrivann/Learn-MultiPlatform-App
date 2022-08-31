import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/scheduling/practice_notification/pages/detail_page.dart';
import 'package:fundamental_app/moduls/scheduling/practice_notification/pages/home_page.dart';

class MainPracticeNotification extends StatelessWidget {
  const MainPracticeNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePageNotification.routeName,
      routes: {
        HomePageNotification.routeName: (context) =>
            const HomePageNotification(),
        DetailPage.routeName: (context) => const DetailPage(),
      },
    );
  }
}
