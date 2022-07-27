import 'package:http/http.dart' as http;

Login() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  var response = await http.get(url);

  print(response.body);
  print("ALO");
}