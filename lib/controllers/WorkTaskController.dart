// ignore_for_file: non_constant_identifier_names

import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/repositories/Sqlite/WorkTaskRepository.dart';

class WorkTaskController {
  final _context = WorkTaskRepository();

  Future<List<WorkTask>> GetAll() async {
    return await _context.GetAll();
  }

  Future<List<WorkTask>> GetAllByDate(DateTime date) async {
    return await _context.GetAllByDate(date);
  }

  Future<WorkTask> GetWorkTaskById(int id) async {
    return await _context.GetWorkTaskById(id);
  }

  Future<List<WorkTask>> GetWorkTaskByFilter(DateTime dateInitial, DateTime dateEnd) async {
    return await _context.GetWorkTaskByFilter(dateInitial, dateEnd);
  }

  Future<int> PostWorkTask(WorkTask model) async {
    return await _context.PostWorkTask(model);
  }

  Future<int> UpdateWorkTask(WorkTask model) async {
    return await _context.UpdateWorkTask(model);
  }

  Future<int> DeleteWorkTask(int id) async {
    return await _context.DeleteWorkTask(id);
  }
}
