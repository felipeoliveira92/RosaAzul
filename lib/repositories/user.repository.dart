// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:appsalao/models/user.dart';
import 'package:dio/dio.dart';

class UserRepository {
  //var url = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/Users';
  var baseUrl = 'http://10.0.2.2:8000/User';
  final _dio = Dio();

  Future<List<User>> GetAll() async {
    final response = await _dio.get(baseUrl);
    final body = response.data as List;
    final users = body.map((u) => User.fromJson(u)).toList();

    return users;
  }

  Future<User> GetUserById(int id) async {
    var url = '$baseUrl/$id';
    var user = User();

    try {
      final response = await _dio.get(url);

      if(response.statusCode == 200)
        user = User.fromJson(response.data); 
        
      return user;
    } 
    catch (e) {
      return user;
    }
  }

  Future<User> GetUserByLogin(String username) async {
    var url = '$baseUrl/$username';
    final response = await _dio.get(url);
    final user = response.data as User;

    return user;
    //arrumar
  }

  Future<Response> PostUser(User model) async {
    final user = model.toJson();

    final response = await _dio.post(baseUrl, data: user);

    return response;
  }

  Future<Response> UpdateUser(User model) async {
    final user = model.toJson();
    final response = await _dio.put(baseUrl, data: user);

    return response;
  }

  Future<Response> DeleteUser(int? id) async {
    var url = '$baseUrl/$id';
    final response = await _dio.delete(url);

    return response;
  }

  Future<bool> Login(String username, String password) async {
    var user = GetUserByLogin(username);

    if (user != null) return true;

    return false;
  }
}
