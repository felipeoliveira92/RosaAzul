// ignore_for_file: non_constant_identifier_names, file_names

import 'package:appsalao/models/client.dart';
import 'package:appsalao/pages/viewModels/worktaskViewModel.dart';
import '../repositories/Sqlite/ClientRepository.dart';

class ClientController {
  final _clientRepository = ClientRepository();

  Future<List<Client>> GetAll() async {
    return await _clientRepository.GetAll();
  }

  Future<Client> GetClientById(int id) async {
    return await _clientRepository.GetClientById(id);
  }

  Future<Client> GetClientByName(String name) async {
    return await _clientRepository.GetClientByName(name);
  }

  Future<int> PostClient(Client model) async {
    return await _clientRepository.PostClient(model);
  }

  Future<int> UpdateClient(Client model) async {
    return await _clientRepository.UpdateClient(model);
  }

  Future<int> DeleteClient(int? id) async {
    return await _clientRepository.DeleteClient(id);
  }

  Future<List<WorkTaskViewModel>> GetHistoric(int id) async {
    return await _clientRepository.GetHistoric(id);
  }
}
