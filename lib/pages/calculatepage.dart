// ignore_for_file: camel_case_types, library_private_types_in_public_api, annotate_overrides

import 'package:flutter/material.dart';

class calculatepage extends StatefulWidget {
  const calculatepage({Key? key}) : super(key: key);
  _calculatepageState createState() => _calculatepageState();
}

class _calculatepageState extends State<calculatepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
      ),
    );
  }
}
