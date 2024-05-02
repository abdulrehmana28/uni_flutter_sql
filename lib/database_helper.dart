import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String dbName = 'flutter.db';
  static const String tableName = 'users';

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    final path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        username TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(String username, String password) async {
    final db = await database;
    return await db!
        .insert(tableName, {'username': username, 'password': password});
  }

  Future<bool> loginUser(String username, String password) async {
    final db = await database;
    final result = await db!.query(tableName,
        where: 'username =? AND password =?', whereArgs: [username, password]);
    return result.isNotEmpty;
  }
}
