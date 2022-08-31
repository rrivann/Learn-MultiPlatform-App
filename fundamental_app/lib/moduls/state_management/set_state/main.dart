import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/state_management/set_state/module_page.dart';

class MainSetState extends StatelessWidget {
  const MainSetState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ModulePage(),
    );
  }
}
