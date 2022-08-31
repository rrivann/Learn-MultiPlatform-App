import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/main_news_app.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/utils/background_service.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/utils/notification_helper.dart';

// void main() {
//   runApp(const MainNewsApp());
// }

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MainNewsApp());
}


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final BackgroundService service = BackgroundService();
//   service.initializeIsolate();
//   AndroidAlarmManager.initialize();
//   runApp(const MainPracticeAlarm());
// }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final NotificationHelper notificationHelper = NotificationHelper();
//   await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
//   notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);
//   runApp(const MainPracticeNotification());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fundamental App',
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {'/': (context) => const CustomWidgetCalculator()},
//     );
//   }
// }
