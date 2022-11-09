import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbApp {
  // DbApp._();

  // static final DbApp instance = DbApp._();

  static const String _createTableUsers = '''
    CREATE TABLE USER(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      username TEXT,
      password TEXT,
      type INT
    );
  ''';

  static const String _createTableClients = '''
    CREATE TABLE Clients(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      cellphone TEXT
    );
  ''';

  static const String _createTableWorks = '''
    CREATE TABLE Works(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      dateInitial TEXT DEFAULT CURRENT_TIMESTAMP,
      dateEnd TEXT DEFAULT CURRENT_TIMESTAMP,
      idClient INT,
      idService INT,
      idUser INT,
      price REAL,
      observation TEXT
    );
  ''';

  static const String _createTableTypeServices = '''
    CREATE TABLE TypeServices(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      description TEXT,
      price REAL
    );
  ''';

  // static Database? _database;
  // Future<Database> get database async =>
  //     _database ??= await _initDatabase();

  Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'salao.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_createTableUsers);
        await db.execute(_createTableClients);
        await db.execute(_createTableWorks);
        await db.execute(_createTableTypeServices);
      },
    );
  }
}
