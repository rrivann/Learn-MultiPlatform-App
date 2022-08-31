import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/state_management/provider/done_module_provider.dart';
import 'package:provider/provider.dart';

class DoneModuleListPage extends StatelessWidget {
  const DoneModuleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doneModuleList =
        Provider.of<DoneModuleProvider>(context, listen: false).doneModuleList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Module List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
          );
        },
        itemCount: doneModuleList.length,
      ),
    );
  }
}
