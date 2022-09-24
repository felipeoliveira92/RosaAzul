// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appsalao/models/user.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  User user;
  String? password;

  ChangePasswordPage({
    Key? key,
    required this.user,
    required this.password,
  }) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }
}
