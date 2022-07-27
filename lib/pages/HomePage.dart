import 'package:appsalao/pages/calculatepage.dart';
import 'package:appsalao/pages/calendarpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: BuildListView(),
    );
  }

  BuildListView() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.calculate_rounded),
          title: Text("Calculadora"),
          subtitle: Text("Calcule quanto ira gastar."),
          onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const calculatepage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.calendar_month),
          title: Text("Calendario"),
          subtitle: Text("Veja e marque horarios."),
          onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const calendarpage()));
          },
        ),
      ],
    );
  }
}
