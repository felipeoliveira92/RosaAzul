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

  Future<int> postUSer(User model) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.insert(nameTable, model.toJson());
      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> updateUser(User model) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.update(nameTable, model.toJson(), where: "id = ?", whereArgs: [model.id]);

      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<bool> userIsLogged() async {
    final Database _dbApp = await DbApp().initDatabase();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable");

      if (User.fromJson(result.first).isLogged == true) return true;

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> userIsEmpty() async {
    final Database _dbApp = await DbApp().initDatabase();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable");

      if (result.isEmpty) return true;

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
