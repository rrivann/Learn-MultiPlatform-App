import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/state_management/provider/done_module_page.dart';
import 'package:fundamental_app/moduls/state_management/provider/module_list.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memulai Pemrograman Dengan Dart'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoneModuleListPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: const ModuleListWidget(),
    );
  }
}
