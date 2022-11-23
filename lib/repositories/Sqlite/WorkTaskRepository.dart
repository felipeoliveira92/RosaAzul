// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/pages/viewModels/worktaskViewModel.dart';
import 'package:sqflite/sqflite.dart';

import '../../database/db.dart';

class WorkTaskRepository {
  static String nameTable = "Works";

  Future<List<WorkTaskViewModel>> GetAll() async {
    final Database _dbApp = await DbApp().initDatabase();
    List<WorkTaskViewModel> listWorks = [];

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable");
      listWorks = result.map((w) => WorkTaskViewModel.fromJson(w)).toList();
      print(listWorks[0].dateInitial);
      return listWorks;
    } catch (e) {
      print(e);
      return listWorks;
    }
  }

  Future<List<WorkTaskViewModel>> GetAllByDate(DateTime date) async {
    date = DateTime(date.year, date.month, date.day);
    final Database _dbApp = await DbApp().initDatabase();
    List<WorkTaskViewModel> listWorks = [];

    try {
      final result = await _dbApp
          .rawQuery("SELECT * FROM $nameTable WHERE DATE(dateInitial) = DATE('$date') ORDER BY dateInitial");
      listWorks = result.map((w) => WorkTaskViewModel.fromJson(w)).toList();
    } catch (e) {
      print(e);
    }

    return listWorks;
  }

  Future<WorkTaskViewModel> GetWorkTaskById(int id) async {
    final Database _dbApp = await DbApp().initDatabase();
    WorkTaskViewModel workTask = WorkTaskViewModel();

    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE id = $id");
      workTask = WorkTaskViewModel.fromJson(result.first);

      return workTask;
    } catch (e) {
      return workTask;
    }
  }

  Future<List<WorkTaskViewModel>> GetWorkTaskByFilter(DateTime dateInitial, DateTime dateEnd) async {
    final Database _dbApp = await DbApp().initDatabase();
    List<WorkTaskViewModel> listWorks = [];

    try {
      final result = await _dbApp.rawQuery(
          "SELECT * FROM $nameTable WHERE dateInitial BETWEEN date('$dateInitial') AND date('$dateEnd') ORDER BY dateInitial");
      listWorks = result.map((w) => WorkTaskViewModel.fromJson(w)).toList();
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
    if (id != 0) {
      final Database _dbApp = await DbApp().initDatabase();
      try {
        final result = await _dbApp.delete(nameTable, where: "id = ?", whereArgs: [id]);

        return result;
      } catch (e) {
        return 0;
      }
    } else {
      return 0;
    }
  }

  Future<List<WorkTaskViewModel>> GetHistoric(int id) async {
    final Database _dbApp = await DbApp().initDatabase();
    List<WorkTaskViewModel> worktasks = [];
    try {
      final result = await _dbApp.rawQuery("SELECT * FROM $nameTable WHERE idClient = $id");

      worktasks = result.map((w) => WorkTaskViewModel.fromJson(w)).toList();
      return worktasks;
    } catch (e) {
      print(e);
      return worktasks;
    }
  }
}
