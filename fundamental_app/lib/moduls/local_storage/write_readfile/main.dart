import 'package:flutter/cupertino.dart';
import 'package:fundamental_app/moduls/local_storage/write_readfile/home_page.dart';

class MainPracticeWrite extends StatelessWidget {
  const MainPracticeWrite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: MyHomeWritePage(),
    );
  }
}
