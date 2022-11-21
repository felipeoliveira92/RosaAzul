// ignore_for_file: non_constant_identifier_names, file_names

import 'package:appsalao/controllers/ClientController.dart';
import 'package:appsalao/controllers/TypeServiceController.dart';
import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/pages/viewModels/worktaskViewModel.dart';
import 'package:appsalao/repositories/Sqlite/WorkTaskRepository.dart';

class WorkTaskController {
  final _context = WorkTaskRepository();
  final _clientRepository = ClientController();
  final _serviceRepository = TypeServiceController();

  Future<List<WorkTaskViewModel>> GetAll() async {
    var worktasks = await _context.GetAll();

    return await _GetClientsAndServices(worktasks);
  }

  Future<List<WorkTaskViewModel>> GetAllByDate(DateTime date) async {
    var worktasks = await _context.GetAllByDate(date);

    return await _GetClientsAndServices(worktasks);    
  }

  Future<WorkTaskViewModel> GetWorkTaskById(int id) async {
    var worktask = await _context.GetWorkTaskById(id);

    return await _GetClientAndService(worktask);
  }

  Future<List<WorkTaskViewModel>> GetWorkTaskByFilter(DateTime dateInitial, DateTime dateEnd) async {
    var worktasks = await _context.GetWorkTaskByFilter(dateInitial, dateEnd);

    return await _GetClientsAndServices(worktasks);
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

  Future<List<WorkTaskViewModel>> _GetClientsAndServices(List<WorkTaskViewModel> model) async {
    for (var element in model) {
      await _clientRepository.GetClientById(element.idClient ??= 0).then((value) => element.client = value);
      await _serviceRepository.GetTypeServiceById(element.idService ??= 0).then((value) => element.typeService = value);
    }
    return model;
  }

  Future<WorkTaskViewModel> _GetClientAndService(WorkTaskViewModel model) async {
    await _clientRepository.GetClientById(model.idClient ??= 0).then((value) => model.client = value);
    await _serviceRepository.GetTypeServiceById(model.idService ??= 0).then((value) => model.typeService = value);

    return model;
  }
}
