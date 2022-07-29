import 'dart:convert';

import 'package:http/http.dart' as http;

var baseUrl = 'https://62e29b1f3891dd9ba8ec4b6d.mockapi.io/api/v1/workTask';

class API {
  static Future getUsers() async {
    Uri url = Uri.parse(baseUrl);
    return await http.get(url);
  }

  static Future getUsersById(int id) async {
    baseUrl += "/" + id.toString();
    Uri url = Uri.parse(baseUrl);
    print(url);
    return await http.get(url);
  }

  static Future getWorkTasks() async {
    Uri url = Uri.parse(baseUrl);
    return await http.get(url);
  }

  static Future getWorkTasksById(int id) async {
    var novaUrl = baseUrl + "/" + id.toString();
    id = 0;
    Uri url = Uri.parse(novaUrl);
    print(novaUrl);
    return await http.get(url);
  }

  static Future postNewWorkTask() async {
    var headers = {
      'Content-Type': 'text/plain'
    };

    var request = http.Request('POST', Uri.parse(baseUrl));
        
    var body = {
      "horario": 16590293383,
      "nomeCliente": "nomeCliente 33",
      "preco": "preco 33",
      "descricao": "descricao 33",
      "id": "33"
    };

    request.body = json.encode(body);
    
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}
