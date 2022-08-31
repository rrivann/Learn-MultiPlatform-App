import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/scheduling/practice_alarm/pages/home_page.dart';

class MainPracticeAlarm extends StatelessWidget {
  static const title = 'Simple Alarm Manager';

  const MainPracticeAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageAlarm(title: title),
    );
  }
}
