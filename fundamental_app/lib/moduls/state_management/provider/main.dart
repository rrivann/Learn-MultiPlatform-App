import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/state_management/provider/done_module_provider.dart';
import 'package:fundamental_app/moduls/state_management/provider/module_page.dart';
import 'package:provider/provider.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({Key? key}) : super(key: key);

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
