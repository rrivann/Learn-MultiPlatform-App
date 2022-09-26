import 'dart:async';

import 'package:core/data/models/tv_series/tv_series_table.dart';
import 'package:encrypt/encrypt.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class TvSeriesDatabaseHelper {
  static TvSeriesDatabaseHelper? _databaseHelper;
  TvSeriesDatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory TvSeriesDatabaseHelper() =>
      _databaseHelper ?? TvSeriesDatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchlist = 'watchlist';
  static const String _tblCache = 'cache';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditontonTvSeries.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
      password: encrypt('password'),
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblCache (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT,
        category TEXT
      );
    ''');
  }

  Future<void> insertCacheTransaction(
      List<TvSeriesTable> series, String category) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final series in series) {
        final seriesJson = series.toJson();
        seriesJson['category'] = category;
        txn.insert(_tblCache, seriesJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCacheTvSeries(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      _tblCache,
      where: 'category = ?',
      whereArgs: [category],
    );

    return results;
  }

  Future<int> clearCache(String category) async {
    final db = await database;
    return await db!.delete(
      _tblCache,
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<int> insertWatchlist(TvSeriesTable tvSerie) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, tvSerie.toJson());
  }

  Future<int> removeWatchlist(TvSeriesTable tvSerie) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [tvSerie.id],
    );
  }

  Future<Map<String, dynamic>?> getTvSeriesById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTvSeries() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWatchlist);

    return results;
  }
}

String encrypt(String plainText) {
  final key = Key.fromUtf8('my 32 length key................');
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64;
}
