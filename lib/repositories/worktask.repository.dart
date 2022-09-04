import 'package:appsalao/models/worktask.dart';
import 'package:dio/dio.dart';

class WorkTaskRepository {
  var baseUrl = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/workTask';
  final _dio = Dio();

  Future<List<WorkTask>> GetAll() async {
    List<WorkTask> listWorks = [];

    try 
    {
      final response = await _dio.get(baseUrl);

      if (response.statusCode == 200) {
        final body = response.data as List;
        listWorks = body.map((u) => WorkTask.fromJson(u)).toList();
      }
    } catch (e) {
      print(e.toString());
    }

    return listWorks;
  }

  Future<List<WorkTask>> GetAllByDate(int date) async {
    List<WorkTask> listWorks = [];

    try 
    {
      final response = await _dio.get(baseUrl);

      if (response.statusCode == 200) {
        final body = response.data as List;
        listWorks = body.map((u) => WorkTask.fromJson(u)).toList();
      }
    } catch (e) {
      print(e.toString());
    }    

    return listWorks;
  }

  Future<List<WorkTask>> GetWorkTaskById(int id) async {
    List<WorkTask> workTasks = [];
    var url = '$baseUrl/$id';

    try 
    {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final workTask = WorkTask.fromJson(response.data);

        workTasks.add(workTask);
      }
    } catch (e) {
      print(e.toString());
    }

    return workTasks;
  }

  Future<Response> PostWorkTask(WorkTask model) async {
    final workTask = model.toJson();

    final response = await _dio.post(baseUrl, data: workTask);

    return response;
  }

  Future<Response> UpdateWorkTask(WorkTask model) async {
    final workTask = model.toJson();

    var url = '$baseUrl/${model.id}';
    final response = await _dio.put(url, data: workTask);

    return response;
  }

  Future<Response> DeleteWorkTask(int id) async {
    var url = '$baseUrl/$id';
    final response = await _dio.delete(url);

    return response;
  }
}
