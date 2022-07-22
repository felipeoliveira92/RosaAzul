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
        title: const Text("Calendario"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.utc(2022, 01, 01),
                lastDate: DateTime.utc(2050, 01, 01),
                onDateChanged: (DateTime value) {},
              ),
              Divider(),
              Text("Horarios Hoje"),
              ListTile(
                leading: Icon(Icons.calculate_rounded),
                title: Text("Calculadora"),
                subtitle: Text("Calcule quanto ira gastar."),
                onTap: () {              
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text("Calendario"),
                subtitle: Text("Veja e marque horarios."),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text("Calendario"),
                subtitle: Text("Veja e marque horarios."),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text("Calendario"),
                subtitle: Text("Veja e marque horarios."),
                onTap: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}