import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  return ListView(
    children: [
      Material(
        child: ListTile(
          tileColor: Colors.white,
          title: const Text('Dark Theme'),
          trailing: Switch.adaptive(
            value: false,
            onChanged: (value) {
              defaultTargetPlatform == TargetPlatform.iOS
                  ? showCupertinoDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Coming Soon!'),
                          content:
                              const Text('This feature will be coming soon!'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    )
                  : showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Coming Soon!'),
                          content:
                              const Text('This feature will be coming soon!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
            },
          ),
        ),
      ),
    ],
  );
}
