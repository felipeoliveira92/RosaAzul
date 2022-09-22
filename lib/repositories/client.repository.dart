// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:appsalao/models/client.dart';
import 'package:dio/dio.dart';

class ClientRepository {
  //var url = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/Clients';
  var baseUrl = 'http://10.0.2.2:8000/Client';
  final _dio = Dio();

  Future<List<Client>> GetAll() async {
    List<Client> clients = [];

    try {
      final response = await _dio.get(baseUrl);
      final body = response.data as List;
      clients = body.map((u) => Client.fromJson(u)).toList();

      return clients;
    } 
    catch (e) {
      print(e);
      return clients;
    }
  }

  Future<Client> GetClientById(int id) async {
    var url = '$baseUrl/$id';
    final response = await _dio.get(url);
    final client = Client.fromJson(response.data);

    return client;
  }

  Future<Client> GetClientByName(String name) async {
    var url = '$baseUrl/$name';
    final response = await _dio.get(url);
    final client = Client.fromJson(response.data);

    return client;
    //arrumar
  }

  Future<Response> PostClient(Client model) async {
    final user = model.toJson();

    final response = await _dio.post(baseUrl, data: user);

    return response;
  }

  Future<Response> UpdateClient(Client model) async {
    final user = model.toJson();
    final response = await _dio.put(baseUrl, data: user);

    return response;
  }

  Future<Response> DeleteClient(int id) async {
    var url = '$baseUrl/$id';
    final response = await _dio.delete(url);

    return response;
  }
}
