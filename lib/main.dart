import 'package:appsalao/pages/calendarpage.dart';
import 'package:appsalao/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:appsalao/pages/newalterworkpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: calendarpage(),      
    );
  }
}