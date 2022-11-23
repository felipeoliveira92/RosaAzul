// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:appsalao/database/db.dart';
import 'package:appsalao/models/client.dart';
import 'package:appsalao/pages/viewModels/worktaskViewModel.dart';
import 'package:sqflite/sqflite.dart';

class ClientRepository {
  static String nameTable = "Clients";

  Future<List<Client>> GetAll() async {
    final Database _dbApp = await DbApp().initDatabase();
    List<Client> clients = [];

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable");
      clients = result.map((c) => Client.fromJson(c)).toList();

      return clients;
    } catch (e) {
      return clients;
    }
  }

  Future<Client> GetClientById(int id) async {
    final Database _dbApp = await DbApp().initDatabase();
    var client = Client();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE id = $id");
      client = Client.fromJson(result.first);

      return client;
    } catch (e) {
      return client;
    }
  }

  Future<Client> GetClientByName(String name) async {
    final Database _dbApp = await DbApp().initDatabase();
    var client = Client();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE name = '$name'");
      client = Client.fromJson(result.first);

      return client;
    } catch (e) {
      return client;
    }
  }

  Future<int> PostClient(Client model) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.insert(nameTable, model.toJson());
      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> UpdateClient(Client model) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.update(nameTable, model.toJson(), where: "id = ?", whereArgs: [model.id]);

      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> DeleteClient(int? id) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.delete(nameTable, where: "id = ?", whereArgs: [id]);

      return result;
    } catch (e) {
      return 0;
    }
  }  
}
