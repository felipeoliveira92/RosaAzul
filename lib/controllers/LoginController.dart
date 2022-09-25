// ignore_for_file: file_names, non_constant_identifier_names

import 'package:appsalao/repositories/user.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final _userRepository = UserRepository();

  Future<bool> Login(String username, String password) async {
    var _sharedPrefer = await SharedPreferences.getInstance();
    //final response = await _userRepository.Login(username, password);

    final Response;

    if (username == "admin@admin.com" && password == "123456") {
      await _sharedPrefer.setString('logado', 'true');
      return true;
    } else {
      return false;
    }

    // if (response == true) {
    //   return true;
    // } else {
    //   return false;
    // }
  }
}
