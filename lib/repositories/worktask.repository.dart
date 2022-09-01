import 'package:appsalao/models/worktask.dart';
import 'package:dio/dio.dart';

class WorkTaskRepository {
  var url = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/workTask';
  final _dio = Dio();

  Future<List<WorkTask>> GetAll() async {
    final response = await _dio.get(url);
    final body = response.data as List;
    final works = body.map((u) => WorkTask.fromJson(u)).toList();

    return works;
  }

  Future<WorkTask> GetWorkTaskById(int id) async {
    url += '/$id';
    final response = await _dio.get(url);
    final workTask = response.data as WorkTask;

    return workTask;
  }

  Future<Response> PostWorkTask(WorkTask model) async {
    final workTask = model.toJson();

    final response = await _dio.post(url, data: workTask);

    return response;
  }

  Future<Response> UpdateWorkTask(WorkTask model) async {
    final workTask = model.toJson();

    url += '/${model.id}';
    final response = await _dio.put(url, data: workTask);

    return response;
  }

  Future<Response> DeleteWorkTask(int id) async {
    url += '/$id';
    final response = await _dio.delete(url);

    return response;
  }
}
