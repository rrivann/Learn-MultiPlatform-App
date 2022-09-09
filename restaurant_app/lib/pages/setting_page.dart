import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/widgets/custom_dialog.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformWidget(
      androidBuilder: _buildSettingAndroidWidget,
      iosBuilder: _buildSettingIosWidget,
    );
  }
}

Widget _buildSettingAndroidWidget(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Settings'),
    ),
    body: _buildList(context),
  );
}

Widget _buildSettingIosWidget(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Settings'),
      transitionBetweenRoutes: false,
      automaticallyImplyLeading: false,
    ),
    child: _buildList(context),
  );
}

Widget _buildList(BuildContext context) {
  return Consumer<PreferencesProvider>(builder: (context, provider, child) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: const Text('Dark Theme'),
            trailing: Switch.adaptive(
              activeColor: primaryColor,
              value: provider.isDarkTheme,
              onChanged: (value) {
                provider.enableDarkTheme(value);
              },
            ),
          ),
        ),
        Material(
          child: ListTile(
            title: const Text('Restaurant Notifications'),
            trailing: Consumer<SchedulingProvider>(
              builder: (context, schedule, child) {
                return Switch.adaptive(
                  activeColor: primaryColor,
                  value: provider.isDailyReminderActive,
                  onChanged: (value) async {
                    if (Platform.isIOS) {
                      customDialog(context);
                    } else {
                      provider.enableDailyReminder(value);
                      schedule.scheduledNews(value);
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  });
}
