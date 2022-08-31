import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fundamental_app/moduls/scheduling/practice_notification/pages/detail_page.dart';
import 'package:fundamental_app/moduls/scheduling/practice_notification/utils/notification_helper.dart';
import 'package:fundamental_app/moduls/scheduling/practice_notification/widget/custom_button.dart';

class HomePageNotification extends StatefulWidget {
  static const routeName = "/";
  const HomePageNotification({Key? key}) : super(key: key);

  @override
  State<HomePageNotification> createState() => _HomePageNotificationState();
}

class _HomePageNotificationState extends State<HomePageNotification> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
        context, DetailPage.routeName);
    _notificationHelper.configureDidReceiveLocalNotificationSubject(
        context, DetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Notification'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                CustomButton(
                  text: 'Show plain notification with payload',
                  onPressed: () async {
                    await _notificationHelper
                        .showNotification(FlutterLocalNotificationsPlugin());
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show plain notification that has no body with payload',
                  onPressed: () async {
                    await _notificationHelper.showNotificationWithNoBody(
                        FlutterLocalNotificationsPlugin());
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show grouped notifications [Android]',
                  onPressed: () async {
                    await _notificationHelper.showGroupedNotifications(
                        FlutterLocalNotificationsPlugin());
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text:
                      'Show progress notification - updates every second [Android]',
                  onPressed: () async {
                    await _notificationHelper.showProgressNotification(
                        FlutterLocalNotificationsPlugin());
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show big picture notification [Android]',
                  onPressed: () async {
                    await _notificationHelper.showBigPictureNotification(
                        FlutterLocalNotificationsPlugin());
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show notification with attachment [iOS]',
                  onPressed: () async {
                    await _notificationHelper.showNotificationWithAttachment(
                        FlutterLocalNotificationsPlugin());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
