import 'package:appsalao/models/user.dart';
import 'package:appsalao/repositories/Sqlite/user_repository.dart';

class UserController {
  final _userRepository = UserRepository();

  Future<User> getUserById(int id) async {
    return await _userRepository.getUserById(id);
  }

  Future<User> getUserByName(String name) async {
    return await _userRepository.getUserByName(name);
  }
}
