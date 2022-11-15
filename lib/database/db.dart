import 'package:appsalao/database/scripts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbApp {
  // DbApp._();

  // static final DbApp instance = DbApp._();

  // static Database? _database;
  // Future<Database> get database async =>
  //     _database ??= await _initDatabase();

  Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'salao.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(createTableUsers);
        await db.execute(createTableClients);
        await db.execute(createTableWorks);
        await db.execute(createTableTypeServices);
      },
    );
  }
}
