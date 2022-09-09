import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteHelper {
  static FavoriteHelper? _instance;

  FavoriteHelper._internal() {
    _instance = this;
  }

  factory FavoriteHelper() => _instance ?? FavoriteHelper._internal();

  static Database? _database;
  static const String _tableFavorite = 'favorites';

  Future<Database> _initializeDb() async {
    String path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurantapp.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableFavorite (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating DOUBLE
          )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();
    return _database;
  }

  Future<void> insertFavorite(favorite) async {
    final db = await database;
    await db!.insert(_tableFavorite, favorite.toJson());
  }

  Future<List<RestaurantList>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tableFavorite);

    return results.map((res) => RestaurantList.fromJson(res)).toList();
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tableFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    await db!.delete(
      _tableFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
