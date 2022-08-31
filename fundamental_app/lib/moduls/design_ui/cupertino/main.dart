import 'package:flutter/cupertino.dart';
import 'package:fundamental_app/moduls/design_ui/cupertino/cupertino_app.dart';

class MainCupertino extends StatelessWidget {
  const MainCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: CupertinoAppScreen(),
    );
  }
}
