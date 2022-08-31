import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/state_management/provider/done_module_provider.dart';
import 'package:provider/provider.dart';

class ModuleListWidget extends StatelessWidget {
  const ModuleListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moduleList.length,
      itemBuilder: (context, index) {
        return Consumer(
          builder: (context, DoneModuleProvider value, child) {
            return ModuleTileWidget(
              moduleName: moduleList[index],
              isDone: value.doneModuleList.contains(moduleList[index]),
              onClick: () {
                value.complete(moduleList[index]);
              },
            );
          },
        );
      },
    );
  }
}

class ModuleTileWidget extends StatelessWidget {
  final String moduleName;
  final bool isDone;
  final Function() onClick;

  const ModuleTileWidget(
      {Key? key,
      required this.moduleName,
      required this.isDone,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
          ? const Icon(Icons.done)
          : ElevatedButton(
              onPressed: onClick,
              child: const Text('Done'),
            ),
    );
  }
}

const List<String> moduleList = [
  'Modul 1 - Pengenalan Dart',
  'Modul 2 - Program Dart Pertamamu',
  'Modul 3 - Dart Fundamental',
  'Modul 4 - Control Flow',
  'Modul 5 - Collections',
  'Modul 6 - Object Oriented Programming',
  'Modul 7 - Functional Styles',
  'Modul 8 - Dart Type System',
  'Modul 9 - Dart Futures',
  'Modul 10 - Effective Dart',
];
