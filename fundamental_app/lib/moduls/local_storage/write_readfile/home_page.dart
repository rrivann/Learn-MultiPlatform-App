// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fundamental_app/moduls/local_storage/write_readfile/file_dialog.dart';
import 'package:fundamental_app/moduls/local_storage/write_readfile/file_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class MyHomeWritePage extends StatefulWidget {
  const MyHomeWritePage({Key? key}) : super(key: key);

  @override
  State<MyHomeWritePage> createState() => _MyHomeWritePageState();
}

class _MyHomeWritePageState extends State<MyHomeWritePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool get _isValid => _titleController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('My Read Write File'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    onPressed: _createNewFile,
                    child: const Text('New File'),
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    child: const Text('Open File'),
                    onPressed: () {
                      _getFilesInDirectory(context);
                    },
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    onPressed: () => _saveFile(context),
                    child: const Text('Save File'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: CupertinoTextField(
                      placeholder: 'File Name',
                      controller: _titleController,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: CupertinoTextField(
                  placeholder: 'Write your notes here...',
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _contentController,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _createNewFile() {
    _titleController.clear();
    _contentController.clear();
  }

  void _saveFile(BuildContext context) async {
    if (_isValid) {
      final filePath = await FileHelper.getFilePath(_titleController.text);
      FileHelper.writeFile(filePath, _contentController.text);
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('File Saved'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              'File Not Created',
              style: TextStyle(color: CupertinoColors.systemRed),
            ),
            content: const Text('File name must not be empty!'),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }

  void _getFilesInDirectory(BuildContext context) async {
    final navigator = Navigator.of(context);
    final directory = await getApplicationDocumentsDirectory();

    final dir = Directory(directory.path);
    final files =
        dir.listSync().toList().where((file) => file.path.contains('txt'));

    final FileSystemEntity? selectedFile = await navigator.push(
      CupertinoPageRoute(
        builder: (context) => FileDialog(
          files: files.toList(),
        ),
        fullscreenDialog: true,
      ),
    );
    if (selectedFile != null) {
      _openFile(selectedFile.path);
    }
  }

  void _openFile(String filePath) async {
    final content = await FileHelper.readFile(filePath);
    _contentController.text = content;
    _titleController.text = split(filePath).last.split('.').first;
  }
}
