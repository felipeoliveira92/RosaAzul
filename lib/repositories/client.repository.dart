import 'package:appsalao/models/client.dart';
import 'package:dio/dio.dart';

class ClientRepository {
  var url = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/Clients';
  final _dio = Dio();

  Future<List<Client>> GetAll() async {
    final response = await _dio.get(url);
    final body = response.data as List;
    final clients = body.map((u) => Client.fromJson(u)).toList();

    return clients;
  }

  Future<Client> GetClientById(int id) async {
    url += '/$id';
    final response = await _dio.get(url);
    final client = Client.fromJson(response.data);

    return client;
  }

  Future<Client> GetClientByName(String name) async {
    url += '/$name';
    final response = await _dio.get(url);
    final client = Client.fromJson(response.data);

    return client;
    //arrumar
  }

  Future<Response> PostClient(Client model) async {
    final user = model.toJson();

    final response = await _dio.post(url, data: user);

    return response;
  }

  Future<Response> UpdateClient(Client model) async {
    final user = model.toJson();

    url += '/${model.id}';
    final response = await _dio.put(url, data: user);

    return response;
  }

  Future<Response> DeleteClient(int id) async {
    url += '/$id';
    final response = await _dio.delete(url);

    return response;
  }
}
