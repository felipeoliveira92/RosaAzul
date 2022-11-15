// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  Future<bool> Login(String username, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: username, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
