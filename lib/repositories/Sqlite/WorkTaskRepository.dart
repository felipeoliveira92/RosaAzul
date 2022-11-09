// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:appsalao/models/worktask.dart';
import 'package:sqflite/sqflite.dart';

import '../../database/db.dart';

class WorkTaskRepository {
  static String nameTable = "Works";

  Future<List<WorkTask>> GetAll() async {
    final Database _dbApp = await DbApp().initDatabase();
    List<WorkTask> listWorks = [];

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable");
      listWorks = result.map((w) => WorkTask.fromJson(w)).toList();
      print(listWorks[0].dateInitial);
      return listWorks;
    } catch (e) {
      print(e);
      return listWorks;
    }
    
  }

  Future<List<WorkTask>> GetAllByDate(DateTime date) async {
    date = DateTime(date.year, date.month, date.day);
    final Database _dbApp = await DbApp().initDatabase();
    List<WorkTask> listWorks = [];

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE DATE(dateInitial) = DATE('$date')");
      listWorks = result.map((w) => WorkTask.fromJson(w)).toList();
    } catch (e) {
      print(e);
    }

    return listWorks;
  }

  Future<WorkTask> GetWorkTaskById(int id) async {
    final Database _dbApp = await DbApp().initDatabase();
    WorkTask workTask = WorkTask();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE id = $id");
      workTask = WorkTask.fromJson(result.first);

      return workTask;
    } catch (e) {
      return workTask;
    }
  }

  Future<List<WorkTask>> GetWorkTaskByFilter(DateTime dateInitial, DateTime dateEnd) async {
    final Database _dbApp = await DbApp().initDatabase();
    List<WorkTask> listWorks = [];

    try {
      final result = await _dbApp.rawQuery(
          "SELECT * FROM $nameTable WHERE dateInitial BETWEEN date('$dateInitial') AND date('$dateEnd') ORDER BY dateInitial");
      listWorks = result.map((w) => WorkTask.fromJson(w)).toList();
    } catch (e) {
      print(e);
    }

    return listWorks;
  }

  Future<int> PostWorkTask(WorkTask model) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.insert(nameTable, model.toJson());
      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> UpdateWorkTask(WorkTask model) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.update(nameTable, model.toJson(), where: "id = ?", whereArgs: [model.id]);

      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> DeleteWorkTask(int id) async {
    final Database _dbApp = await DbApp().initDatabase();
    try {
      final result = await _dbApp.delete(nameTable, where: "id = ?", whereArgs: [id]);

      return result;
    } catch (e) {
      return 0;
    }
  }
}
