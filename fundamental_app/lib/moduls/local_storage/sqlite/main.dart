// import 'package:sqflite/sqflite.dart';

class SqDatabase {
  // static late Database _database;
  // static String _tableName = 'notes';

  // Future<Database> get database async {
  //   _database = await initializeDb();
  //   return database;
  // }

  // Future<Database> initializeDb() async {
  //   var path = await getDatabasesPath();
  //   var db = openDatabase(
  //     join(path, 'note_db.db'),
  //     onCreate: (db, version) async {
  //       await db.execute(
  //         '''CREATE TABLE $_tableName (
  //            id INTEGER PRIMARY KEY,
  //            title TEXT, description TEXT
  //          )''',
  //       );
  //     },
  //     version: 1,
  //   );

  //   return db;
  // }

  //   Future<void> insertNote(Note note) async {
  //   final Database db = await database;
  //   await db.insert(_tableName, note.toMap());
  // }

  // Future<List<Note>> getNotes() async {
  // final Database db = await database;
  // List<Map<String, dynamic>> results = await db.query(_tableName);

  // return results.map((res) => Note.fromMap(res)).toList();
  // }

  //   Future<Note> getNoteById(int id) async {
  //   final Database db = await database;
  //   List<Map<String, dynamic>> results = await db.query(
  //     _tableName,
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );

  //   return results.map((res) => Note.fromMap(res)).first;
  // }

}
