import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_app/firebase_options.dart';
import 'package:fundamental_app/moduls/firebase/dicoding_chatting/main.dart';

// void main() {
//   runApp(const PracticeChatFirebase());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PracticeChatFirebase());
}


// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final NotificationHelper notificationHelper = NotificationHelper();
//   final BackgroundService service = BackgroundService();
//   service.initializeIsolate();
//   if (Platform.isAndroid) {
//     await AndroidAlarmManager.initialize();
//   }
//   await notificationHelper.initNotifications(FlutterLocalNotificationsPlugin());
//   runApp(const MainNewsApp());
// }


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
