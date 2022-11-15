import 'package:appsalao/database/db.dart';
import 'package:appsalao/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  static String nameTable = "USER";

  Future<User> getUserById(int id) async {
    final Database _dbApp = await DbApp().initDatabase();
    var user = User();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE id = $id");
      user = User.fromJson(result.first);

      return user;
    } catch (e) {
      print(e);
      return user;
    }
  }

  Future<User> getUserByName(String name) async {
    final Database _dbApp = await DbApp().initDatabase();
    var user = User();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE name = $name");
      user = User.fromJson(result.first);

      return user;
    } catch (e) {
      print(e);
      return user;
    }
  }
}
