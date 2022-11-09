// ignore_for_file: non_constant_identifier_names

import 'package:appsalao/models/typeServices.dart';
import 'package:dio/dio.dart';

class TypeServiceRepository {
  var baseUrl = 'http://10.0.2.2:8000/Service';
  final _dio = Dio();

  Future<List<TypeService>> GetAll() async {
    List<TypeService> typeServices = [];

    try {
      final response = await _dio.get(baseUrl);
      final body = response.data as List;
      typeServices = body.map((u) => TypeService.fromJson(u)).toList();

      return typeServices;
    } catch (e) {
      return typeServices;
    }
  }

  Future<TypeService> GetTypeServiceById(int id) async {
    var url = '$baseUrl/$id';
    final response = await _dio.get(url);
    final typeService = TypeService.fromJson(response.data);

    return typeService;
  }

  Future<TypeService> GetTypeServiceByName(String name) async {
    var url = '$baseUrl/$name';
    final response = await _dio.get(url);
    final typeService = TypeService.fromJson(response.data);

    return typeService;
  }

  Future<int> PostTypeService(TypeService model) async {
    try {
      final typeService = model.toJson();
      final response = await _dio.post(baseUrl, data: typeService);

      if (response.statusCode == 200) return 1;

      return 0;
    } catch (e) {
      return 0;
    }
  }

  Future<Response> UpdateTypeService(TypeService model) async {
    final typeService = model.toJson();
    final response = await _dio.put(baseUrl, data: typeService);

    return response;
  }

  Future<Response> DeleteTypeService(int? id) async {
    var url = '$baseUrl/$id';
    final response = await _dio.delete(url);

    return response;    
  }
}
