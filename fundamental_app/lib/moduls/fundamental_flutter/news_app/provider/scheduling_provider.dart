import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/utils/background_service.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/utils/date_time_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      // print('Scheduling News Activated');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      // print('Scheduling News Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
