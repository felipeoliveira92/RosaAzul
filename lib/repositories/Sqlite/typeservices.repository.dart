// ignore_for_file: non_constant_identifier_names

import 'package:appsalao/database/db.dart';
import 'package:appsalao/models/typeServices.dart';
import 'package:sqflite/sqflite.dart';

class TypeServiceRepository {
  //final _dbApp = DbApp().database;

  Future<List<TypeService>> GetAll() async {
    final Database _dbApp = await DbApp().initDatabase();
    List<TypeService> typeServices = [];

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM TypeServices");
      typeServices = result.map((e) => TypeService.fromJson(e)).toList();

      return typeServices;
    } catch (e) {
      print(e);
      return typeServices;
    }
  }

  Future<TypeService> GetTypeServiceById(int id) async {
    final Database _dbApp = await DbApp().initDatabase();
    TypeService typeService = TypeService();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM TypeServices WHERE id = $id");
      typeService = result.map((e) => TypeService.fromJson(e)).first;

      return typeService;
    } catch (e) {
      print(e);
      return typeService;
    }
  }

  Future<TypeService> GetTypeServiceByName(String name) async {
    final Database _dbApp = await DbApp().initDatabase();
    TypeService typeService = TypeService();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM TypeServices WHERE name = '$name'");
      typeService = TypeService.fromJson(result.first);

      return typeService;
    } catch (e) {
      print(e);
      return typeService;
    }
  }

  Future<int> PostTypeService(TypeService model) async {
    final Database _dbApp = await DbApp().initDatabase();

    try {
      final result = await _dbApp.insert("TypeServices", model.toJson());
      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> UpdateTypeService(TypeService model) async {
    final Database _dbApp = await DbApp().initDatabase();

    try {
      final result = await _dbApp.update("TypeServices", model.toJson(), where: "id = ?", whereArgs: [model.id]);

      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> DeleteTypeService(int? id) async {
    final Database _dbApp = await DbApp().initDatabase();

    try {
      final result = await _dbApp.delete("TypeServices", where: "id = ?", whereArgs: [id]);

      return result;
    } catch (e) {
      return 0;
    }
  }
}
