import 'dart:convert';

import 'package:appsalao/models/worktask.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/workTask';

class API {  

  static Future getWorkTasks() async {
    Uri url = Uri.parse(baseUrl);
    return await http.get(url);
  }

  static Future getWorkTasksById(int id) async {
    var novaUrl = "${baseUrl.toString()}/${id.toString()}";
    id = 0;
    Uri url = Uri.parse(novaUrl);
    return await http.get(url);
  }

  static Future postNewWorkTask(WorkTask model) async {
    var headers = {'Content-Type': 'text/plain'};

    var request = http.Request('POST', Uri.parse(baseUrl));

    // var body = {
    //   "horario": model.horario,
    //   "nomeCliente": model.nomeCliente,
    //   "preco": model.preco,
    //   "descricao": model.descricao,
    //   "id": model.id
    // };
    //request.body = json.encode(body);

    var body = model.toJson();
    request.body = json.encode(body);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      //print(await response.stream.bytesToString());
      return true;
    } else {
      //print(response.reasonPhrase);
      return false;
    }
  }
}
