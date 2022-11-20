// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:appsalao/controllers/user_controller.dart';
import 'package:appsalao/pages/Global/HomePage.dart';
import 'package:appsalao/pages/User/login.page.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = UserController();

    userRepository.userIsLogged().then((result) => {
      if (result == true)
        {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()))}
    });

    return MaterialApp(
      title: 'Rosa Azul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
