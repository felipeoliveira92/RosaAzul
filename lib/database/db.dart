import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Database? _database;

  static const String _createTableUsers = '''
    CREATE TABLE USER(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      username TEXT,
      password TEXT,
      type INTEGER,
    );
  ''';

  static const String _createTableClients = '''
    CREATE TABLE Clients(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      cellphone TEXT,
    );
  ''';

  get database async {
    if (_database != null) return _database;

    return await initDatabase();
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'salao.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_createTableUsers);
        await db.execute(_createTableClients);
      },
    );
  }
}
