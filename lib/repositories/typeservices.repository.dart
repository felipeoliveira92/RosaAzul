// ignore_for_file: non_constant_identifier_names

import 'package:appsalao/models/typeServices.dart';
import 'package:dio/dio.dart';

class TypeServiceRepository {
  var url = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/';
  final _dio = Dio();

  Future<List<TypeService>> GetAll() async {
    List<TypeService> typeServices = [];

    try {
      final response = await _dio.get(url);
      final body = response.data as List;
      typeServices = body.map((u) => TypeService.fromJson(u)).toList();

      return typeServices;
    } 
    catch (e) {
      print(e);
      return typeServices;
    }
  }

  Future<TypeService> GetTypeServiceById(int id) async {
    url += '/$id';
    final response = await _dio.get(url);
    final typeService = TypeService.fromJson(response.data);

    return typeService;
  }

  Future<TypeService> GetTypeServiceByName(String name) async {
    url += '/$name';
    final response = await _dio.get(url);
    final typeService = TypeService.fromJson(response.data);

    return typeService;
    //arrumar
  }

  Future<Response> PostTypeService(TypeService model) async {
    final typeService = model.toJson();

    final response = await _dio.post(url, data: typeService);

    return response;
  }

  Future<Response> UpdateTypeService(TypeService model) async {
    final typeService = model.toJson();

    url += '/${model.id}';
    final response = await _dio.put(url, data: typeService);

    return response;
  }

  Future<Response> DeleteTypeService(int id) async {
    url += '/$id';
    final response = await _dio.delete(url);

    return response;
  }
}
