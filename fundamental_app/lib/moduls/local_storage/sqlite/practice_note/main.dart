import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/local_storage/sqlite/practice_note/db_provider.dart';
import 'package:fundamental_app/moduls/local_storage/sqlite/practice_note/note_list_page.dart';
import 'package:provider/provider.dart';

class PracticeNote extends StatelessWidget {
  const PracticeNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const NoteListPage(),
      ),
    );
  }
}
