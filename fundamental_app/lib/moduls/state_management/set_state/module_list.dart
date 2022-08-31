import 'package:flutter/material.dart';

class ModuleListWidget extends StatefulWidget {
  final List<String> doneModuleList;

  const ModuleListWidget({Key? key, required this.doneModuleList})
      : super(key: key);

  @override
  State<ModuleListWidget> createState() => _ModuleListWidgetState();
}

class _ModuleListWidgetState extends State<ModuleListWidget> {
  final List<String> _moduleList = const [
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moduleList.length,
      itemBuilder: (context, index) {
        return ModuleTileWidget(
          moduleName: _moduleList[index],
          isDone: widget.doneModuleList.contains(_moduleList[index]),
          onClick: () {
            setState(() {
              widget.doneModuleList.add(_moduleList[index]);
            });
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
