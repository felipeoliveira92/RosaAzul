import 'package:flutter/material.dart';

class calendarpage extends StatefulWidget {
  const calendarpage({Key? key}) : super(key: key);
  _calendarpageState createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Calendario")),
      ),
      body: Center(
          child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.utc(2022, 01, 01),
        lastDate: DateTime.utc(2050, 01, 01),
        onDateChanged: (DateTime value) {},
      )),
    );
  }
}