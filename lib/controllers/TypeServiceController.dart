// ignore_for_file: file_names, non_constant_identifier_names

import '../models/typeServices.dart';
import '../repositories/typeservices.repository.dart';

class TypeServiceController {
  final typeServiceRepository = TypeServiceRepository();

  Future<List<TypeService>> GetAll() async {
    return await typeServiceRepository.GetAll();
  }

  Future<TypeService> GetTypeServiceById(int id) async {
    return await typeServiceRepository.GetTypeServiceById(id);
  }

  Future<TypeService> GetTypeServiceByName(String name) async {
    return await typeServiceRepository.GetTypeServiceByName(name);
  }

  Future<int> PostTypeService(TypeService model) async {
    return await typeServiceRepository.PostTypeService(model);
  }

  Future<int> UpdateTypeService(TypeService model) async {
    return await typeServiceRepository.UpdateTypeService(model);
  }

  Future<int> DeleteTypeService(int? id) async {
    return await typeServiceRepository.DeleteTypeService(id);
  }
}
