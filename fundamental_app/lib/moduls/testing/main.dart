import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/testing/provider/done_module_provider.dart';
import 'package:fundamental_app/moduls/testing/ui/module_page.dart';
import 'package:provider/provider.dart';

class PracticeTesting extends StatelessWidget {
  const PracticeTesting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneModuleProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ModulePage(),
      ),
    );
  }
}
