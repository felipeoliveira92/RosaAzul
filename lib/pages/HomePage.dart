import 'package:appsalao/pages/calculatepage.dart';
import 'package:appsalao/pages/calendarpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
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
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              child: Text("Menu"),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),            
          ],
        ),
      ),
    );
  }

  BuildListView() {
    return ListView(
      children: <Widget>[
        DrawerHeader(
              child: Text("Menu"),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
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
        ListTile(
          leading: Icon(Icons.money),
          title: Text("Faturamento"),
          subtitle: Text("Veja quanto esta lucrando."),
          onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const calendarpage()));
          },
        ),
      ],
    );
  }
}
