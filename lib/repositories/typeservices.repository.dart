// ignore_for_file: non_constant_identifier_names

import 'package:appsalao/models/typeServices.dart';
import 'package:dio/dio.dart';

class TypeServiceRepository {
  //var url = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/';
  var baseUrl = 'http://10.0.2.2:8000/Service';
  final _dio = Dio();

  Future<List<TypeService>> GetAll() async {
    List<TypeService> typeServices = [];

    try {
      final response = await _dio.get(baseUrl);
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
    //arrumar
  }

  Future<Response> PostTypeService(TypeService model) async {
    final typeService = model.toJson();
    final response = await _dio.post(baseUrl, data: typeService);

    return response;
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
