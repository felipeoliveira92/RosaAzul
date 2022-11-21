// ignore_for_file: file_names, non_constant_identifier_names, library_prefixes

import 'package:appsalao/Global/user_logged.dart';
import 'package:appsalao/models/user.dart' as userApp;
import 'package:appsalao/repositories/Sqlite/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final userRepository = UserRepository();

  Future<bool> Login(String username, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: username, password: password);

      userApp.User user = userApp.User();
      user.name = userCredential.user?.displayName ?? "";
      user.username = username;
      user.password = password;
      user.type = int.parse(userApp.typeUser.user.index.toString());

      try {
        userIsEmpty().then((value) => {
          if (!value)
          {
            updateUser(user),
            userLogged = user,
          }
          else
          {
            postUser(user),
            userLogged = user,
          }
        });

        return true;
      } catch (e) {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> userIsLogged() async {
    return await userRepository.userIsLogged();
  }

  void postUser(userApp.User model) async {
    await userRepository.postUSer(model);
  }

  void updateUser(userApp.User model) async {
    await userRepository.updateUser(model);
  }

  Future<bool> userIsEmpty() async {
    return await userRepository.userIsEmpty();
  }
}
