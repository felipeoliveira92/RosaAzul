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

  Future<int> postUser(User model) async {
    return await _userRepository.postUSer(model);
  }

  Future<int> updateUser(User model) async {
    return await _userRepository.updateUser(model);
  }

  Future<bool> userIsLogged() async {
    return await _userRepository.userIsLogged();
  }

  Future<bool> userIsEmpty() async {
    return await _userRepository.userIsEmpty();
  }
}
